# This migration comes from ygg_shop_models_engine (originally 20120206151900)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class RenamePriceColumns < ActiveRecord::Migration
  def self.up
    # agreements
    remove_column :shop_agreements, :delta_percentage

    rename_column :shop_agreements, :original_sale_price, :product_startup_price
    rename_column :shop_agreements, :original_price_per_day, :product_recurring_price

    add_column :shop_agreements, :package_startup_delta_percentage, :decimal, :scale => 6, :precision => 14
    add_column :shop_agreements, :package_recurring_delta_percentage, :decimal, :scale => 6, :precision => 14

    add_column :shop_agreements, :my_startup_delta, :decimal, :scale => 6, :precision => 14
    add_column :shop_agreements, :my_recurring_delta, :decimal, :scale => 6, :precision => 14
    add_column :shop_agreements, :my_startup_delta_percentage, :decimal, :scale => 6, :precision => 14
    add_column :shop_agreements, :my_recurring_delta_percentage, :decimal, :scale => 6, :precision => 14

    rename_column :shop_agreements, :delta_startup, :package_startup_delta
    rename_column :shop_agreements, :delta_per_day, :package_recurring_delta

    # product revision
    rename_column :shop_product_revisions, :price_per_day, :recurring_price

    # package details
    rename_column :shop_package_details, :delta_per_day, :recurring_delta
    rename_column :shop_package_details, :delta_startup, :startup_delta
    add_column :shop_package_details, :startup_delta_percentage, :decimal, :scale => 6, :precision => 14
    add_column :shop_package_details, :recurring_delta_percentage, :decimal, :scale => 6, :precision => 14

  end

  def self.down

  end
end
