# This migration comes from ygg_shop_models_engine (originally 20120528160700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddInvoiceIndexes < ActiveRecord::Migration
  def self.up
    add_column :shop_invoices, :external_document_id, :string, :limit => 32
    add_index :shop_invoices, :document_id, :unique => true
    add_index :shop_invoices, :external_document_id, :unique => true
  end

  def self.down
    remove_index :shop_invoices, :external_document_id
    remove_index :shop_invoices, :document_id
    remove_column :shop_invoices, :external_document_id
  end
end
