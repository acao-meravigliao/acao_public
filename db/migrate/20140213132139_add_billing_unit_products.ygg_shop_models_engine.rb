# This migration comes from ygg_shop_models_engine (originally 20120328155500)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddBillingUnitProducts < ActiveRecord::Migration
  def self.up
    add_column :shop_product_revisions, :billing_period_unit, :string,
               :default => :days, :after => :billing_period, :null => false,
               :limit => 32
    remove_column :shop_agreements, :startup_billed
    add_column :shop_agreements, :startup_billed, :datetime, :null => true, :default => nil
    remove_column :shop_billing_entries, :agreement_service_instance_id
    add_column :shop_billing_entries, :label, :string, :limit => 64, :null => false
    add_column :shop_billing_entries, :from, :datetime, :null => true
    add_column :shop_billing_entries, :to,   :datetime, :null => true
    add_column :shop_billing_entries, :units, :integer, :null => true
  end

  def self.down
    change_column :shop_agreements, :startup_billed, :boolean
    remove_column :shop_product_revisions, :billing_period_unit
    remove_column :shop_billing_entries, :label
    remove_column :shop_billing_entries, :label
    remove_column :shop_billing_entries, :from
    remove_column :shop_billing_entries, :to
    remove_column :shop_billing_entries, :units
  end
end
