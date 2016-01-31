# This migration comes from ygg_core_models_engine (originally 20100119133541)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreHttpSessions < ActiveRecord::Migration
  def self.up
    create_table :core_http_sessions do |t|
      t.timestamps
      t.string :uuid, :limit => 36, :null => false

      t.string :remote_addr, :limit => 42
      t.integer :remote_port
      t.text :x_forwarded_for
      t.text :via
      t.string :server_addr, :limit => 42
      t.integer :server_port
      t.string :server_name, :limit => 64
      t.text :referer
      t.text :user_agent
      t.text :request_uri

      t.references :auth_credential
      t.references :auth_identity
      t.string :auth_method, :limit => 32
      t.string :auth_confidence, :limit => 16

      t.string :status, :limit => 32, :null => false
      t.string :close_reason, :limit => 32
      t.timestamp :close_time
    end

    add_index :core_http_sessions, :uuid
    add_index :core_http_sessions, :updated_at
  end

  def self.down
    drop_table :core_http_sessions
  end
end
