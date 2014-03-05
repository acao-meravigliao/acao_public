# This migration comes from ygg_shop_models_engine (originally 20120524094600)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddInvoiceToBillingEntry < ActiveRecord::Migration
  def self.up
    add_column :shop_billing_entries, :invoice_to_type, :string, :after => :price, :null => false, :limit => 64
    add_column :shop_billing_entries, :invoice_to_id, :integer, :after => :price, :null => false
    add_column :shop_invoices, :holder_type, :string, :after => :uuid, :null => false, :limit => 64
    add_column :shop_invoices, :holder_id, :integer, :after => :uuid, :null => false
    add_index :shop_billing_entries, [ :invoice_to_type, :invoice_to_id ], :unique => false, :name => 'invoice_to'
    add_index :shop_invoices, [ :holder_type, :holder_id ], :unique => false, :name => 'invoice_holder'
  end

  def self.down
    remove_index :shop_billing_entries, :invoice_to
    remove_column :shop_billing_entries, :invoice_to_type
    remove_column :shop_billing_entries, :invoice_to_id
    remove_index :shop_invoices, :invoice_holder
    remove_column :shop_invoices, :holder_type
    remove_column :shop_invoices, :holder_id
  end
end
