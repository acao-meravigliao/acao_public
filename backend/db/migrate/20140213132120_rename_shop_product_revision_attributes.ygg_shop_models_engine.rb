# This migration comes from ygg_shop_models_engine (originally 20111014121400)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class RenameShopProductRevisionAttributes < ActiveRecord::Migration
  def self.up
    rename_table :shop_product_revision_attributes, :shop_product_revision_options
    add_column :shop_product_revision_options, :option_type, :string, :limit => 32
    add_column :shop_product_revision_options, :default_value, :text
    add_column :shop_product_revision_options, :hidden, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :shop_product_revision_options, :hidden
    remove_column :shop_product_revision_options, :default_value
    remove_column :shop_product_revision_options, :option_type
    rename_table :shop_product_revision_options, :shop_product_revision_attributes
  end
end
