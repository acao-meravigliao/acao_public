# This migration comes from ygg_core_models_engine (originally 20080918003300)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreLogEntries < ActiveRecord::Migration
  def self.up
    create_table :core_log_entries do |t|
      t.timestamps # should we keep them?

      t.datetime :timestamp, :null => false

      t.string :transaction_uuid, :limit => 36

      t.references :person
      t.references :identity

      t.text :description, :null => false
      t.text :notes
      t.text :extra_info

      t.references :http_session
    end

    add_index :core_log_entries, :timestamp
    add_index :core_log_entries, :person_id
    add_index :core_log_entries, :identity_id

    create_table :core_log_entry_details do |t|
      t.references :log_entry

      t.string :operation, :limit => 32

      t.references :obj, :polymorphic => true

      t.string :obj_uuid, :limit => 36
      t.text :obj_key
      t.text :obj_snapshot
    end

    add_index :core_log_entry_details, :log_entry_id
    add_index :core_log_entry_details, [ :obj_id, :obj_type ]
  end

  def self.down
    drop_table :core_log_entry_details
    drop_table :core_log_entries
  end
end
