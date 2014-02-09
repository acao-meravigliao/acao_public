# This migration comes from ygg_core_models_engine (originally 20081003090219)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreContacts < ActiveRecord::Migration
  def self.up
    create_table :core_contacts do |t|
      t.references :identity
      t.references :owner, :polymorphic => true
      t.references :contact_area
      t.references :contact_role

      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :core_contacts
  end
end
