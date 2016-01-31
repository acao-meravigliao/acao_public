# This migration comes from ygg_shop_models_engine (originally 20111111111111)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopResellers < ActiveRecord::Migration
  def self.up
    create_table :shop_resellers, :force => true do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.string :name, :limit => 64
      t.text :descr

      t.text :notes
    end
  end

  def self.down
    drop_table :shop_resellers
  end
end
