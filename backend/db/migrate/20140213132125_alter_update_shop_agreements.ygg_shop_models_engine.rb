# This migration comes from ygg_shop_models_engine (originally 20111115173600)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AlterUpdateShopAgreements < ActiveRecord::Migration
  def self.up

    add_column :shop_agreements, :customer_id, :integer
    add_column :shop_agreements, :customer_type, :string, :limit=>64
    add_column :shop_agreements, :invoice_to_id, :integer
    add_column :shop_agreements, :invoice_to_type, :string, :limit=>64

    execute "update shop_agreements set customer_id=customer_person_id, customer_type='Ygg::Core::Person' where customer_person_id is not null;"
    execute "update shop_agreements set customer_id=customer_organization_id, customer_type='Ygg::Core::Organization' where customer_organization_id is not null;"
    execute "update shop_agreements set invoice_to_id=invoice_to_person_id, invoice_to_type='Ygg::Core::Person' where invoice_to_person_id is not null;"
    execute "update shop_agreements set invoice_to_id=invoice_to_organization_id, invoice_to_type='Ygg::Core::Organization' where invoice_to_organization_id is not null;"

    remove_column :shop_agreements, :customer_organization_id
    remove_column :shop_agreements, :customer_person_id
    remove_column :shop_agreements, :invoice_to_organization_id
    remove_column :shop_agreements, :invoice_to_person_id
  end

  def self.down
  end
end
