# This migration comes from ygg_core_models_engine (originally 20130915015600)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreAddNotification < ActiveRecord::Migration
  def self.up
    create_table :core_notif_templates do |t|
      t.timestamps
      t.string :uuid, :limit => 36, :null => false

      t.string :symbol, :limit => 32, :null => false

      t.text :subject, :null => false
      t.text :body
      t.text :additional_headers
    end

    create_table :core_notifications do |t|
      t.timestamps
      t.string :uuid, :limit => 36, :null => false

      t.datetime :timestamp, :null => false

      t.references :person
      t.references :obj, :polymorphic => true

      t.string :importance, :limit => 32, :null => false

      t.text :subject
      t.text :body
      t.text :headers
    end
    add_index :core_notifications, :timestamp
    add_index :core_notifications, :person_id
    add_index :core_notifications, :obj_type
    add_index :core_notifications, [ :obj_type, :obj_id ]

    add_column :core_groups, :symbol, :string, :limit => 64

    add_column :core_people, :email, :text
  end
end
