# This migration comes from ygg_shop_models_engine (originally 20120528091700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ModifyInvoiceDetails < ActiveRecord::Migration
  def self.up
    remove_column :shop_invoice_details, :days
    remove_column :shop_invoice_details, :agreement_id
    remove_column :shop_invoice_details, :invoice_id

    rename_column :shop_invoice_details, :from_date, :from
    rename_column :shop_invoice_details, :to_date, :to
    add_column    :shop_invoice_details, :details_group_id, :integer, :null => false
    add_column    :shop_invoice_details, :label, :string, :limit => 128, :null => false, :after => :to
    add_column    :shop_invoice_details, :units, :integer
    add_column    :shop_invoice_details, :billed_entry_id, :integer, :null => true, :after => :details_group_id
  end

  def self.down
    remove_column :shop_invoice_details, :billing_entry_id
    remove_column :shop_invoice_details, :units
    remove_column :shop_invoice_details, :label
    rename_column :shop_invoice_details, :from, :from_date
    rename_column :shop_invoice_details, :to, :to_date

    add_column    :shop_invoice_details, :agreement_id, :integer, :null => true
    add_column    :shop_invoice_details, :invoice_id, :integer, :null => true
    add_column    :shop_invoice_details, :days, :integer, :null => true

  end
end
