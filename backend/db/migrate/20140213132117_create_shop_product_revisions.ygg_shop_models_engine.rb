# This migration comes from ygg_shop_models_engine (originally 20101122092300)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopProductRevisions < ActiveRecord::Migration
  def self.up
    create_table :shop_product_revisions do |t|
      t.references :product # the root product
      t.string :revision_number # format YYYYMMDDHHMMSS
      t.string :name
      t.text :service_parameters # revision can change how to setup the service

      t.timestamp :on_sale_from

      t.decimal :startup_price, :scale => 6, :precision => 14
      t.decimal :price_per_day, :scale => 6, :precision => 14

      t.text :notes
    end

    create_table :shop_product_revision_attributes do |t|
      t.references :product_revision

      t.string :symbol, :limit => 64
      t.string :name, :limit => 128
      t.text :definition

      # Definition example:
      # {
      #   :variants => { 10 => { :startup => 15, :per_day => 0.045 },
      #               20 => { :startup => 15, :per_day => 0.035 }
      #             },
      #   :default => 10,
      #   :hidden => false
      # }
    end
  end

  def self.down
    drop_table :shop_product_revisions
    drop_table :shop_product_revision_attributes
  end
end
