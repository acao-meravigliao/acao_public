# This migration comes from ygg_shop_models_engine (originally 20120604194400)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddPackageInstanceCustomer < ActiveRecord::Migration
  def self.up
    add_column :shop_package_instances, :customer_id, :integer
    add_column :shop_package_instances, :customer_type, :string, :limit => 64

    Ygg::Shop::PackageInstance.all.each { |x| x.customer = x.agreements.first.customer ; x.save! }
  end

  def self.down
    remove_column :shop_package_instances, :customer_type
    remove_column :shop_package_instances, :customer_id
  end
end
