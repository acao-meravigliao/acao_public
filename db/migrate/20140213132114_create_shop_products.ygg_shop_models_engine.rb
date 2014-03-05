# This migration comes from ygg_shop_models_engine (originally 20100712140000)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopProducts < ActiveRecord::Migration
  def self.up
    create_table :shop_products do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.text :name
      t.string :service_class, :limit => 64

      t.boolean :single_activation, :default=>false
      t.integer :max_instances, :default=>1

      t.timestamp :on_sale_to
    end
  end

  def self.down
    drop_table :shop_products
    drop_table :shop_product_attributes
  end
end
