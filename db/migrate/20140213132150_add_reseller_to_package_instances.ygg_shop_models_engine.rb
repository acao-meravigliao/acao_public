# This migration comes from ygg_shop_models_engine (originally 20120813185101)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddResellerToPackageInstances < ActiveRecord::Migration
  def self.up
    add_column :shop_package_instances, :reseller_id, :integer

    Ygg::Shop::PackageInstance.all.each do |pi|
      pi.reseller_id = pi.agreements.first.reseller_id
      pi.save!
    end
  end

  def self.down
  end
end
