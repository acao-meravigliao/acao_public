# This migration comes from ygg_shop_models_engine (originally 20120221111600)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AlterPperiods < ActiveRecord::Migration

  def self.up
    add_column :shop_agreements, :prices_period, :string, :limit => 32
    remove_column :shop_agreements, :product_recurring_price_pperiod
    remove_column :shop_agreements, :package_recurring_delta_pperiod
    remove_column :shop_agreements, :my_recurring_delta_pperiod
  end

  def self.down
  end
end
