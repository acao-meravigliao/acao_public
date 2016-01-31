# This migration comes from ygg_core_models_engine (originally 20120111094020)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddLocationTypeToCoreLocations < ActiveRecord::Migration
  def self.up
    add_column :core_locations, :location_type, :string, :limit=>32
  end

  def self.down
    remove_column :core_locations, :location_type
  end
end
