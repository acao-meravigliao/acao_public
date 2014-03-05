namespace :acao do
  desc 'Sync tables'

  task('sync:frequent' => :environment) do
    Ygg::Acao::Flight.sync_frequent!
  end

  task(:sync => :environment) do
    Ygg::Acao::Plane.import_flarmnet_db!
    Ygg::Acao::Flight.sync!

    r_records = nil
    l_records = nil

    added_records = []
    removed_records = []
    updated_records = []

    ActiveRecord::Base.transaction do
      r_records = Ygg::Acao::MainDb::Socio.order(:id_soci_dati_generale => :asc)
      l_records = Ygg::Core::Person.where('acao_ext_id IS NOT NULL').order(:acao_ext_id => :asc)

      r_enum = r_records.each
      l_enum = l_records.each

      r = r_enum.next rescue nil
      l = l_enum.next rescue nil

      while r || l
        if l && !l.acao_ext_id
          # Ignore
          l = l_enum.next rescue nil
        elsif !l || (r && r.id_soci_dati_generale < l.acao_ext_id)
puts "ADDING SOCIO id=#{r.id_soci_dati_generale} CODICE=#{r.codice_socio_dati_generale}"

          person = Ygg::Core::Person.create!({
            :acao_ext_id => r.id_soci_dati_generale,
            :acao_code => r.codice_socio_dati_generale,
            :first_name => r.Nome.blank? ? '?' : r.Nome,
            :last_name => r.Cognome,
            :gender => r.Sesso,
            :residence_location => Ygg::Core::Location.new_for([ r.Via, r.Citta, r.Provincia, r.CAP, r.Stato ].join(', ')),
            :birth_date => r.Data_Nascita,
            :birth_location => Ygg::Core::Location.new_for([ r.Nato_a ].join(', ')),
            :italian_fiscal_code => r.Codice_Fiscale,
          })

          sleep 0.5

          person.channels << Ygg::Core::Channel.new(:channel_type => 'email', :value => r.Email) if r.Email
          person.channels << Ygg::Core::Channel.new(:channel_type => 'phone', :value => r.Telefono_Casa, :descr => 'Casa') if r.Telefono_Casa
          person.channels << Ygg::Core::Channel.new(:channel_type => 'phone', :value => r.Telefono_Ufficio, :descr => 'Ufficio') if r.Telefono_Ufficio
          person.channels << Ygg::Core::Channel.new(:channel_type => 'phone', :value => r.Telefono_Altro, :descr => 'Ufficio') if r.Telefono_Altro
          person.channels << Ygg::Core::Channel.new(:channel_type => 'mobile', :value => r.Telefono_Cellulare) if r.Telefono_Cellulare
          person.channels << Ygg::Core::Channel.new(:channel_type => 'fax', :value => r.Fax) if r.Fax
          person.channels << Ygg::Core::Channel.new(:channel_type => 'url', :value => r.Sito_Web) if r.Sito_Web

          person.identities << Ygg::Core::Identity.new({
            :qualified => r.codice_socio_dati_generale.to_s + '@legacy.acao.it',
            :credentials => [ Ygg::Core::Identity::Credential::HashedPassword.new(:password => r.Password) ],
          })

          person.identities << Ygg::Core::Identity.new({
            :qualified => r.Email,
            :credentials => [ Ygg::Core::Identity::Credential::HashedPassword.new(:password => r.Password) ],
          })

          added_records << r

          r = r_enum.next rescue nil
        elsif !r || (l && r.id_soci_dati_generale > l.acao_ext_id)
puts "REMOVED SOCIO #{l.first_name} #{l.last_name}"
          l.acao_ext_id = nil
          l.save!

          removed_records << l

          l = l_enum.next rescue nil
        else
          updated_records << l

          l = l_enum.next rescue nil
          r = r_enum.next rescue nil
        end
      end
    end

    # Merge annunci ML
    ####################################################à

    r_emails = {}

    fucked_emails = [
      'no',
      'alessandro.porta@porta',
      'enzio.provvidone@it.agusta',
      'info@naer-design',
      'marco.cosso@mediaset,it',
    ]

    r_records.select { |x| !x.Email.empty? }.each { |x|
      x.Email.strip.downcase.split(';').each { |y|
        if !fucked_emails.include?(y)
          r_emails[y] = "#{x.Nome} #{x.Cognome}"
        end
      }
    }

    l_emails = IO::popen([ '/usr/sbin/list_members', 'annunci' ]).read.split("\n").map { |x| x.strip.downcase }.sort!

    members_to_add = []
    members_to_remove = []

    r_enum = r_emails.keys.sort!.each
    l_enum = l_emails.each

    r = r_enum.next rescue nil
    l = l_enum.next rescue nil

    while r || l
      if !l || (r && r < l)
        members_to_add << "#{r_emails[r]} <#{r}>"

        r = r_enum.next rescue nil
      elsif !r || (l && r > l)
        members_to_remove << l
        l = l_enum.next rescue nil
      else
        l = l_enum.next rescue nil
        r = r_enum.next rescue nil
      end
    end

    puts "ANNUNCI MEMBERS TO ADD = #{members_to_add}"
    puts "ANNUNCI MEMBERS TO REMOVE = #{members_to_remove}"

    if members_to_add.any?
      io = IO::popen([ '/usr/sbin/add_members', '-r', '-', '--admin-notify=y', '--welcome-msg=n', 'annunci' ], 'w')
      io.write(members_to_add.join("\n"))
      io.close
    end

    if members_to_remove.any?
      io = IO::popen([ '/usr/sbin/remove_members', '--file', '-', '--nouserack', '--noadminack', 'annunci' ], 'w')
      io.write(members_to_remove.join("\n"))
      io.close
    end

    # Update soci ML
    ###############################

    members_to_add = added_records.map { |x| "#{x.Nome} #{x.Cognome} <#{x.Email}>" }

    puts "SOCI MEMBERS TO ADD = #{members_to_add}"
    puts "SOCI MEMBERS TO REMOVE = #{members_to_remove}"

    if members_to_add.any?
      io = IO::popen([ '/usr/sbin/add_members', '-r', '-', 'soci' ], 'w')
      io.write(members_to_add.join("\n"))
      io.close
    end

    if members_to_remove.any?
      io = IO::popen([ '/usr/sbin/remove_members', '--file', '-', 'soci' ], 'w')
      io.write(members_to_remove.join("\n"))
      io.close
    end
  end
end
