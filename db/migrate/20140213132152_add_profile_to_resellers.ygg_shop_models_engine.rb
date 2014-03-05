# This migration comes from ygg_shop_models_engine (originally 20120814175401)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddProfileToResellers < ActiveRecord::Migration
  def self.up
    add_column :shop_resellers, :profile, :string, :limit => 64
  end

  def self.down
    remove_column :shop_resellers, :profile
  end
end
