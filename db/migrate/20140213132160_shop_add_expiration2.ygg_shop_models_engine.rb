# This migration comes from ygg_shop_models_engine (originally 20130130030800)
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

class ShopAddExpiration2 < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :closure_time, :timestamp
    rename_column :shop_agreements, :requested_closure_time, :requested_expiration_time
    remove_column :shop_product_revisions, :expiration_grace_period
    add_column :shop_product_revisions, :expiration_grace_period, :integer
    remove_column :shop_agreement_service_instances, :annihilation_time
  end
end
