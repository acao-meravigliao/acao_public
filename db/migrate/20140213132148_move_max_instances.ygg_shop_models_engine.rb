# This migration comes from ygg_shop_models_engine (originally 20120620160300)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class MoveMaxInstances < ActiveRecord::Migration
  def self.up
    add_column :shop_product_revisions, :max_instances, :integer, :default => 1
    Ygg::Shop::ProductRevision.all.each { |x| x.max_instances = x.product.max_instances ; x.save! }
    remove_column :shop_products, :max_instances
  end

  def self.down
    add_column :shop_products, :max_instances, :integer, :default => 1
    Ygg::Shop::Product.all.each { |x| x.max_instances = x.current_revision.max_instances ; x.save! }
    remove_column :shop_product_revisions, :max_instances
  end
end
