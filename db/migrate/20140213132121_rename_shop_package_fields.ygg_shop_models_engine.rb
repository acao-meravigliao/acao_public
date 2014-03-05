# This migration comes from ygg_shop_models_engine (originally 20111018111100)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class RenameShopPackageFields < ActiveRecord::Migration
  def self.up
    rename_column :shop_package_detail_filters, :package_detail_id, :detail_id
  end

  def self.down
    rename_column :shop_package_detail_filters, :detail_id, :package_detail_id
  end
end
