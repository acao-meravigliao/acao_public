# This migration comes from ygg_core_models_engine (originally 20090906103512)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreContactViews < ActiveRecord::Migration
  def self.up
#     create_view :core_v_contacts, 'SELECT
#      core_contacts.id AS contact_id,
#      core_contacts.identity_id AS identity_id,
#      core_identities.qualified AS identity,
#      core_contacts.owner_id AS owner_id,
#      core_contacts.owner_type AS owner_type,
#      core_contact_areas.name AS area,
#      core_contact_roles.name AS role
#      FROM core_contacts
#      INNER JOIN core_contact_areas ON core_contacts.contact_area_id = core_contact_areas.id
#      INNER JOIN core_contact_roles ON core_contacts.contact_role_id = core_contact_roles.id
#      INNER JOIN core_identities ON core_contacts.identity_id = core_identities.id' do |t|
#        t.column :contact_id
#        t.column :identity_id
#        t.column :identity
#        t.column :owner_id
#        t.column :owner_type
#        t.column :area
#        t.column :role
#      end
  end

  def self.down
#    drop_view :core_v_contacts
  end
end
