# This migration comes from ygg_shop_models_engine (originally 20120918155553)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddSaleDateToPackageInstances < ActiveRecord::Migration
  def self.up
    add_column :shop_package_instances, :sale_date, :datetime
  end

  def self.down
    remove_column :shop_package_instances, :sale_date
  end
end
