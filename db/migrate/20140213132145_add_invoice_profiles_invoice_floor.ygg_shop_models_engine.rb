# This migration comes from ygg_shop_models_engine (originally 20120530094700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddInvoiceProfilesInvoiceFloor < ActiveRecord::Migration
  def self.up
    add_column :shop_invoice_profiles, :invoice_floor, :decimal, :scale => 6, :precision => 14, :null => true
  end

  def self.down
    remove_column :shop_invoice_profiles, :invoice_floor
  end
end
