# This migration comes from ygg_shop_models_engine (originally 20100712174700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopPackages < ActiveRecord::Migration
  def self.up
    create_table :shop_packages, :force => true do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.string :code, :limit => 32

      t.string :name, :limit => 64
      t.text :descr

      t.date :on_sale_from
      t.date :on_sale_to

      t.text :notes
    end

    create_table :shop_package_details do |t|
      t.references :package

      t.references :product
      t.references :product_revision # is specified , this must be used!

      # delta applied to prices
      t.decimal :delta_startup, :scale=>6, :precision=> 14
      t.decimal :delta_per_day, :scale=>6, :precision=> 14
    end

    create_table :shop_package_detail_filters do |t|
      t.references :package_detail

      t.string :symbol, :limit => 64
      t.text :filter
      
      # each record listed in this table is shown during the shopping process;
      # in filter are presents only the fields to be excluded from the
      # corresponding symbol in revision details definitions
    end
  end

  def self.down
    drop_table :shop_package_detail_attributes
    drop_table :shop_package_details
    drop_table :shop_packages
  end
end
