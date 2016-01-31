# This migration comes from ygg_shop_models_engine (originally 20110721164500)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddShopActivations < ActiveRecord::Migration
  def self.up
    # products are billed after or before a number of days
    add_column :shop_product_revisions, :billing_period, :integer, :default => 30 # days
    add_column :shop_product_revisions, :billing_disposition, :string,
      :default => :before, :limit => 32

    # startup costs are effectively billed
    # when agreement is signed
    # when first instance is created
    # when instance is provisioned and confirmed ready
    # when ALL instances are provisioned and confirmed
    add_column :shop_product_revisions, :startup_is_paid, :string,
      :default => :sale, :limit => 32
    # when to start the recurrent billing
    add_column :shop_product_revisions, :billing_starts, :string,
      :default => :ready, :limit => 32
    # can instances of this products be suspended?
    add_column :shop_product_revisions, :suspend_allowed, :boolean
    # has the startup fee been billed for this agreement
    add_column :shop_agreements, :startup_billed, :boolean, :default => false
  end

  def self.down
    remove_column :shop_product_revisions, :billing_period
    remove_column :shop_product_revisions, :billing_disposition
    remove_column :shop_product_revisions, :startup_is_paid
    remove_column :shop_product_revisions, :billing_starts
    remove_column :shop_product_revisions, :suspend_allowed
    remove_column :shop_agreements, :startup_billed
  end
end
