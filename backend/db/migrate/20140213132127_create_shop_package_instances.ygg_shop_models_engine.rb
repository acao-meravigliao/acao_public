# This migration comes from ygg_shop_models_engine (originally 20120116160200)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopPackageInstances < ActiveRecord::Migration
  def self.up
    create_table :shop_package_instances do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.references :package
    end
    add_index :shop_package_instances, :package_id
  end

  def self.down
    drop_table :shop_package_instances
  end
end
