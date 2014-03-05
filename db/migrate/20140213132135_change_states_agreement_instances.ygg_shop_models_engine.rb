# This migration comes from ygg_shop_models_engine (originally 20120323110900)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class ChangeStatesAgreementInstances < ActiveRecord::Migration
  def self.up
    change_column :shop_agreement_service_instances, :state,
                  :string, :limit => 32, :default => :new,
                  :null => false
  end

  def self.down
    change_column :shop_agreement_service_instances, :state,
                  :enum, :limit => 32, :default => :unprovisioned
  end
end
