# This migration comes from ygg_shop_models_engine (originally 20120528114700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddInvoiceProfiles < ActiveRecord::Migration
  def self.up
    create_table :shop_invoice_profiles do |t|
      t.references :billable, :polymorphic => true, :null =>false
      t.integer    :invoice_months, :default => 2, :null => false
      t.decimal    :invoice_ceiling, :decimal, :scale => 6, :precision => 14, :null => true
      t.date       :last_invoice, :null => true
      t.text       :payment_notes
    end
  end

  def self.down
    drop_table :shop_invoice_profiles
  end
end
