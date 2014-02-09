# This migration comes from ygg_core_models_engine (originally 20111111162100)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddCoreResellers < ActiveRecord::Migration
  def self.up
    add_column :core_people, :reseller_id, :integer
    add_column :core_organizations, :reseller_id, :integer
  end

  def self.down
    remove_column :core_people, :reseller_id
    remove_column :core_organizations, :reseller_id
  end
end
