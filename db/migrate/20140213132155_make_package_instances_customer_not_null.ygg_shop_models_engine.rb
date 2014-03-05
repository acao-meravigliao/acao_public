# This migration comes from ygg_shop_models_engine (originally 20120918155554)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class MakePackageInstancesCustomerNotNull < ActiveRecord::Migration
  def self.up
    Ygg::Shop::PackageInstance.all.each do |x|
      if !x.customer
        x.customer = x.agreements.first.customer
        x.save!
      end
    end

    change_column :shop_package_instances, :customer_id, :integer, :null => false
    change_column :shop_package_instances, :customer_type, :string, :limit => 32, :null => false
  end

  def self.down
  end
end
