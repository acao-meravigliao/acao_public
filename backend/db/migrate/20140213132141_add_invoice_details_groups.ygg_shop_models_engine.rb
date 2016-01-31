# This migration comes from ygg_shop_models_engine (originally 20120528091600)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddInvoiceDetailsGroups < ActiveRecord::Migration
  def self.up
    create_table :shop_invoice_details_groups do |t|
      t.references :invoice, :null => false
      t.string :label, :limit => 128
    end
    add_index :shop_invoice_details_groups, :invoice_id
  end

  def self.down
    drop_table :shop_invoice_details_groups

  end
end
