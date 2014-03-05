# This migration comes from ygg_shop_models_engine (originally 20120914175353)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddNotNullToCustomers < ActiveRecord::Migration
  def self.up
    change_column :shop_agreements, :customer_id, :integer, :null => false
    change_column :shop_agreements, :customer_type, :string, :limit => 32, :null => false
  end

  def self.down
  end
end
