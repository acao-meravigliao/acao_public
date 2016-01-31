# This migration comes from ygg_core_models_engine (originally 20080918003430)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreOrganizations < ActiveRecord::Migration
  def self.up
    create_table :core_organizations do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.string     :type, :limit => 3

      t.string     :name

      t.references :headquarters_location
      t.references :registered_office_location
      t.references :invoicing_location

      t.string     :vat_number, :limit => 16
      t.string     :italian_fiscal_code, :limit => 16
      t.text       :notes

      t.string  :handle
    end
  end

  def self.down
    drop_table :core_organizations
  end
end
