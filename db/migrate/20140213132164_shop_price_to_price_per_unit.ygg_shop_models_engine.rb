# This migration comes from ygg_shop_models_engine (originally 20130517154100)
# This migration comes from ygg_shop_models_engine (originally 20121218160700)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ShopPriceToPricePerUnit < ActiveRecord::Migration
  def self.up
    execute 'UPDATE shop_billing_entries SET price=price/units'
    rename_column :shop_billing_entries, :price, :price_per_unit

    execute 'UPDATE shop_invoice_details SET price=price/units'
    rename_column :shop_invoice_details, :price, :price_per_unit
  end
end
