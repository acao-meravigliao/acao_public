# This migration comes from ygg_shop_models_engine (originally 20120206164600)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddUuidToBillingEntry < ActiveRecord::Migration
  def self.up
    add_column :shop_billing_entries, :uuid, :string, :limit => 36, :null => false
  end

  def self.down
    remove_column :shop_billing_entries, :uuid
  end
end
