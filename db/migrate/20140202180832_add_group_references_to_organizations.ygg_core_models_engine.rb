# This migration comes from ygg_core_models_engine (originally 20120704125300)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddGroupReferencesToOrganizations < ActiveRecord::Migration
  def self.up
    add_column :core_organizations, :admin_group_id, :integer
  end

  def self.down
    remove_column :core_organizations, :admin_group_id
  end
end
