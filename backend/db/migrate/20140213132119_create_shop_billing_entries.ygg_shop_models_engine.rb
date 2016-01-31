# This migration comes from ygg_shop_models_engine (originally 20110721164600)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopBillingEntries < ActiveRecord::Migration
  def self.up
    create_table :shop_billing_entries do |t|
      t.references :invoice
      t.references :agreement, :null => false
      t.references :agreement_service_instance

      t.decimal :price, :scale => 6, :precision => 14

      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :shop_billing_entries
  end
end
