# This migration comes from ygg_core_models_engine (originally 20080918003400)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreIdentities < ActiveRecord::Migration
  def self.up
    create_table :core_identities do |t|
      t.references :person
      t.string     :qualified, :limit => 128, :null => false

      # this is how much we actually trust the identity to belong to the person
      # it claims to.
      # Eg:
      # User claimed => :weak
      # Verified email => :medium
      # We have a personally signed agreement => :strong
      #
      t.string     :confidence, :limit => 20
    end

    add_index 'core_identities', ['qualified'], :unique => true
    add_index 'core_identities', ['person_id'], :unique => false
  end

  def self.down
    drop_table :core_identities
  end
end
