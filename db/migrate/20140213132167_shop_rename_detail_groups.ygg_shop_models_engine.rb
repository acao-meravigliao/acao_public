# This migration comes from ygg_shop_models_engine (originally 20131011173400)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ShopRenameDetailGroups < ActiveRecord::Migration
  def self.up
    rename_column :shop_invoice_details, :details_group_id, :detail_group_id
  end
end
