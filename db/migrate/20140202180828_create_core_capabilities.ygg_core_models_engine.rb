# This migration comes from ygg_core_models_engine (originally 20120215170000)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreCapabilities < ActiveRecord::Migration
  def self.up
    create_table :core_capabilities do |t|
      t.string :name, :limit => 32, :null => false
      t.string :descr
    end
    add_index :core_capabilities, :name

    create_table :core_identity_capabilities do |t|
      t.references :identity
      t.references :capability
    end
    add_index :core_identity_capabilities, :identity_id
    add_index :core_identity_capabilities, :capability_id
#    add_index :core_identity_capabilities, [ :identity_id, :capability_id ]
  end

  def self.down
    drop_table :core_identity_capabilities
    drop_table :core_capabilities
  end
end
