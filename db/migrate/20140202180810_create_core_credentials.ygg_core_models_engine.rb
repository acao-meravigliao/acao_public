# This migration comes from ygg_core_models_engine (originally 20080918003401)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreCredentials < ActiveRecord::Migration
  def self.up
    create_table :core_credentials do |t|
      t.references :identity, :null => false
      t.string     :sti_type, :limit => 64, :null => false # Subclass name to implement STI
      t.text       :descr # human-friendly description of credential type and content
      t.text       :data, :null => false

#      t.timestamp  :valid_from
#      t.timestamp  :valid_to

      t.string     :x509_m_serial, :limit => 32
      t.string     :x509_i_dn
      t.string     :x509_s_dn
      t.string     :x509_s_dn_cn
      t.string     :x509_s_dn_email
    end

    add_index :core_credentials, [ :identity_id ]
    add_index :core_credentials, [ :identity_id, :sti_type ]

    add_index :core_credentials, [ :x509_i_dn ]
    add_index :core_credentials, [ :x509_i_dn, :x509_m_serial ], :unique => true
  end

  def self.down
    drop_table :core_credentials
  end
end
