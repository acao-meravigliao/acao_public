# This migration comes from ygg_shop_models_engine (originally 20111019121900)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddShopAgreementsOptions < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :user_specified_options, :text
    rename_column :shop_agreements, :product_attributes, :product_specified_options
  end

  def self.down
    rename_column :shop_agreements, :product_specified_options, :product_attributes
    remove_column :shop_agreements, :user_specified_options
  end
end
