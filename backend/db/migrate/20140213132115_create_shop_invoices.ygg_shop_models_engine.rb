# This migration comes from ygg_shop_models_engine (originally 20100712153800)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopInvoices < ActiveRecord::Migration
  def self.up
    create_table :shop_invoices do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.string :state, :limit => 32

      t.references :replaced_by_invoice

      t.string :document_id, :limit => 32, :null => false
      t.date :creation_date
      t.date :dispatch_date

      t.date :payment_expiration_date

      t.text :document_data

      t.text :private_notes
      t.text :public_notes
    end

    create_table :shop_invoice_details do |t|
      t.references :invoice
      t.references :agreement

      t.date :from_date
      t.date :to_date

      t.decimal :price, :scale => 6, :precision => 14
      t.integer :days

      t.text :private_notes
      t.text :public_notes
    end
  end

  def self.down
  end
end
