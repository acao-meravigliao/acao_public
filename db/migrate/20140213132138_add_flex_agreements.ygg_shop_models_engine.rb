# This migration comes from ygg_shop_models_engine (originally 20120323175500)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddFlexAgreements < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :flex, :boolean, :default => false, :after => :single_activation, :null => false
    rename_column :shop_products, :is_flex, :flex
  end

  def self.down
    rename_column :shop_products, :flex, :is_flex
    remove_column :shop_agreements, :flex
  end
end
