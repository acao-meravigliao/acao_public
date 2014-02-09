# This migration comes from ygg_core_models_engine (originally 20081003090233)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreContactAreas < ActiveRecord::Migration
  def self.up
    create_table :core_contact_areas do |t|
      t.string  :name, :limit => 32
      t.text    :descr
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :core_contact_areas
  end
end
