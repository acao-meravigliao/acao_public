# This migration comes from ygg_core_models_engine (originally 20081003102222)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreGroupMembers < ActiveRecord::Migration
  def self.up
    create_table :core_group_members do |t|
      t.integer :group_id
      t.integer :identity_id
    end
  end

  def self.down
    drop_table :core_group_members
  end
end
