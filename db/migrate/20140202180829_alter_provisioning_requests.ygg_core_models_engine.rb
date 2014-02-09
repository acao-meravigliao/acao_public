# This migration comes from ygg_core_models_engine (originally 20120309093924)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AlterProvisioningRequests < ActiveRecord::Migration
  def self.up
    add_column :core_provisioning_requests, :log, :text
    add_column :core_provisioning_requests, :precent, :integer
  end

  def self.down
    remove_column :core_provisioning_requests, :log
    remove_column :core_provisioning_requests, :precent
  end
end
