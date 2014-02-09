# This migration comes from ygg_core_models_engine (originally 20121120104543)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreOrganizationPeople < ActiveRecord::Migration
  def self.up
    create_table :core_organization_people do |t|
      t.timestamps
      t.references :organization, :null => false
      t.references :person, :null => false
      t.boolean :is_signer
    end

    add_index :core_organization_people, [ :organization_id, :person_id ], :unique => true
    add_index :core_organization_people, :organization_id
    add_index :core_organization_people, :person_id
  end

  def self.down
    drop_table :core_organization_people
  end
end
