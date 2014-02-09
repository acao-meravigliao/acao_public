# This migration comes from ygg_core_models_engine (originally 20130729152700)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreChangeLocationsAccuracyToFloat < ActiveRecord::Migration
  def self.up
    change_column :core_locations, :accuracy, :float
  end

  def self.down
    change_column :core_locations, :accuracy, :integer
  end
end
