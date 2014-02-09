# This migration comes from ygg_core_models_engine (originally 20121003210400)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class RenameProvisioningRequestsToTasks < ActiveRecord::Migration
  def self.up
    rename_table :core_provisioning_requests, :core_tasks
  end

  def self.down
    rename_table :core_tasks, :core_provisioning_requests
  end
end
