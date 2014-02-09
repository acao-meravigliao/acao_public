namespace :acao do
  desc 'Sync tables'

  task(:sync => :environment) do

    ActiveRecord::Base.transaction do
      r_enum = Ygg::Acao::MainDb::Socio.order(:id_soci_dati_generale => :asc).each
      l_enum = Ygg::Core::Person.where('acao_ext_id IS NOT NULL').order(:acao_ext_id => :asc).each

      r = r_enum.next rescue nil
      l = l_enum.next rescue nil

      while r || l
        if l && !l.acao_ext_id
          # Ignore
          l = l_enum.next rescue nil
        elsif !l || (r && r.id_soci_dati_generale < l.acao_ext_id)
puts "ADDING id=#{r.id_soci_dati_generale} CODICE=#{r.codice_socio_dati_generale}"
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

          r = r_enum.next rescue nil
        elsif !r || (l && r.id_soci_dati_generale > l.acao_ext_id)
puts "NOP"
          l = l_enum.next rescue nil
        else
puts "UPD #{r.id_soci_dati_generale}"
          l = l_enum.next rescue nil
          r = r_enum.next rescue nil
        end
      end
    end
  end
end
