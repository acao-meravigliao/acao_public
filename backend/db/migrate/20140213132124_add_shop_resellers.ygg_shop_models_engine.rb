# This migration comes from ygg_shop_models_engine (originally 20111111162300)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddShopResellers < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :reseller_id, :integer
  end

  def self.down
    remove_column :shop_agreements, :reseller_id
  end
end
