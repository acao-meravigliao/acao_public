# This migration comes from ygg_shop_models_engine (originally 20131004000200)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ShopMoveInvoiceProfiles < ActiveRecord::Migration
  def self.up
    add_column :core_people, :invoice_last, :date
    add_column :core_people, :invoice_months, :integer, :default => 2
    add_column :core_people, :invoice_ceiling, :decimal, :precision => 14, :scale => 6
    add_column :core_people, :invoice_floor, :decimal, :precision => 14, :scale => 6

    add_column :core_organizations, :invoice_last, :date
    add_column :core_organizations, :invoice_months, :integer, :default => 2
    add_column :core_organizations, :invoice_ceiling, :decimal, :precision => 14, :scale => 6
    add_column :core_organizations, :invoice_floor, :decimal, :precision => 14, :scale => 6

    drop_table :shop_invoice_profiles
  end
end
