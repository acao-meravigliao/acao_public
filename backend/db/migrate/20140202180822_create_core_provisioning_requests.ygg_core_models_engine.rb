# This migration comes from ygg_core_models_engine (originally 20110928012441)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreProvisioningRequests < ActiveRecord::Migration
  def self.up
    create_table :core_provisioning_requests do |t|
      t.string :uuid, :limit => 36, :null => false

      t.datetime   :created_at
      t.datetime   :expected_completion
      t.datetime   :completed_at

      t.string     :status, :limit => 32

      t.string     :description

      t.references :obj, :polymorphic => true

      t.references :depends_on

      t.string     :subsystem, :limit => 32
      t.string     :node, :limit => 64
      t.string     :operation, :limit => 32
      t.text       :request_data
      t.text       :result_data
    end
    add_index :core_provisioning_requests, :uuid, :unique => true
    add_index :core_provisioning_requests, [ :obj_type, :obj_id ]
  end

  def self.down
    drop_table :core_provisioning_requests
  end
end
