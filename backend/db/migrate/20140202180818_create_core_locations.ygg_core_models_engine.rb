# This migration comes from ygg_core_models_engine (originally 20090709091613)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreLocations < ActiveRecord::Migration
  def self.up
    create_table :core_locations do |t|
      t.integer    :locatable_id
      t.string     :locatable_type, :limit => 127
      t.string     :role, :limit => 32
      t.text       :street_address
      t.string     :city, :limit => 64
      t.string     :state, :limit => 64
      t.string     :country_code, :limit => 2
      t.string     :zip, :limit => 12
      t.float      :lat
      t.float      :lng
      t.string     :provider, :limit => 16
      t.integer    :accuracy

      t.text       :raw_address # contains the FULL RAW address
    end
  end

  def self.down
    drop_table :core_locations
  end
end
