# This migration comes from ygg_core_models_engine (originally 20081003102218)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreGroups < ActiveRecord::Migration
  def self.up
    create_table :core_groups do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.string     :name
      t.text       :description
    end
  end

  def self.down
    drop_table :core_groups
  end
end
