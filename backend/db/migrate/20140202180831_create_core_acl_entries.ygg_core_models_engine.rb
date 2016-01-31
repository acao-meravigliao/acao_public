# This migration comes from ygg_core_models_engine (originally 20120703152300)
#
# Yggdra Core
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreAclEntries < ActiveRecord::Migration
  def self.up
    create_table :core_acl_entries do |t|
      t.references :group
      t.references :identity
      t.references :obj, :polymorphic => true, :null => false
      t.string :capability, :limit => 32, :null => false
    end
    add_index :core_acl_entries, :group_id
    add_index :core_acl_entries, :identity_id
    add_index :core_acl_entries, [ :obj_id, :obj_type ]
  end

  def self.down
    drop_table :core_acl_entries
  end
end
