# This migration comes from ygg_core_models_engine (originally 20130723105800)
# This migration comes from ygg_core_models_engine (originally 20130723105800)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreKlasses < ActiveRecord::Migration
  def self.up
    create_table :core_klasses do |t|
      t.string :name, :limit => 128, :null => false
    end
  end

  def self.down
    drop_table :core_klasses
  end
end
