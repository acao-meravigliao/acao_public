# This migration comes from ygg_shop_models_engine (originally 20121212174901)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddInvoiceProfileRefToOrganizationPerson < ActiveRecord::Migration
  def self.up
    add_column :core_organizations, :invoice_profile_id, :integer
    add_column :core_people, :invoice_profile_id, :integer
  end

  def self.down
    remove_column :core_organizations, :invoice_profile_id
    remove_column :core_people, :invoice_profile_id
  end
end
