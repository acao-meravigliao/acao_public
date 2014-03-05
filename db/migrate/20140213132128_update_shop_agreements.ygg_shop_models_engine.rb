# This migration comes from ygg_shop_models_engine (originally 20120116162800)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class UpdateShopAgreements < ActiveRecord::Migration
  def self.up
    rename_column :shop_agreements, :package_id, :package_instance_id
  end

  def self.down
    rename_column :shop_agreements, :package_instance_id, :package_id
  end
end
