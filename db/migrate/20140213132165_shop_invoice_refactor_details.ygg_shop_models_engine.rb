# This migration comes from ygg_shop_models_engine (originally 20130901212600)
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

class ShopInvoiceRefactorDetails < ActiveRecord::Migration
  def self.up
    add_column :shop_invoice_details, :invoice_id, :integer
    change_column :shop_invoice_details, :details_group_id, :integer, :null => true
    add_column :shop_invoice_details, :linenumber, :integer
    add_column :shop_invoice_details, :details_group_correlation, :integer

    rename_table :shop_invoice_details_groups, :shop_invoice_detail_groups
    add_column :shop_invoice_detail_groups, :parent_id, :integer
    add_column :shop_invoice_detail_groups, :linenumber, :integer
    add_column :shop_invoice_detail_groups, :temporary_id, :integer
  end
end
