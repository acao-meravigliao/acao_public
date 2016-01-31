# This migration comes from ygg_shop_models_engine (originally 20131125121000)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ShopInvoicesMakeUnitsNotNull < ActiveRecord::Migration
  def self.up
    Ygg::Shop::Invoice.all.each { |x| x.details.each { |y| y.units ||= 0 } ; x.save! }
    change_column :shop_invoice_details, :units, :integer, :null => false
  end
end
