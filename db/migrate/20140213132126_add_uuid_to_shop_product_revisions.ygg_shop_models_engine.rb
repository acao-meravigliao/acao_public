# This migration comes from ygg_shop_models_engine (originally 20120111093802)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddUuidToShopProductRevisions < ActiveRecord::Migration
  def self.up
    add_column :shop_product_revisions, :uuid, :string, :limit => 36
  end

  def self.down
    remove_column :shop_product_revisions, :uuid
  end
end
