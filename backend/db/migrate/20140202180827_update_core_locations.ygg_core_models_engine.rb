# This migration comes from ygg_core_models_engine (originally 20120123154720)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class UpdateCoreLocations < ActiveRecord::Migration
  def self.up
    remove_column :core_locations, :raw_address
    add_column :core_locations, :region, :string, :limit=>128
  end

  def self.down
    add_column :core_locations, :raw_address, :string
    remove_column :core_locations, :region
  end
end
