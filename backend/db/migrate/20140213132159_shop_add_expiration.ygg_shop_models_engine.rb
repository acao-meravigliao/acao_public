# This migration comes from ygg_shop_models_engine (originally 20121218160700)
# This migration comes from ygg_shop_models_engine (originally 20121218160700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ShopAddExpiration < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :requested_closure_time, :timestamp
    add_column :shop_agreement_service_instances, :annihilation_time, :timestamp
    add_column :shop_product_revisions, :expiration_grace_period, :timestamp
  end

  def self.down
    remove_column :shop_product_revisions, :expiration_grace_period
    remove_column :shop_agreement_service_instances, :annihilation_time
    remove_column :shop_agreements, :requested_closure_time
  end
end
