# This migration comes from ygg_core_models_engine (originally 20130730162900)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreAddVariousIndexes < ActiveRecord::Migration
  def self.up
    add_index :core_identity_capabilities, [ :identity_id, :capability_id ], :unique => true, :name => 'core_identity_capabilities_j'
  end

  def self.down
  end
end
