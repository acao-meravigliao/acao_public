# This migration comes from ygg_shop_models_engine (originally 20130419151000)
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

class ShopAddStandby < ActiveRecord::Migration
  def self.up
    add_column :shop_agreement_service_instances, :standby, :boolean, :default => false, :null => false
  end
end
