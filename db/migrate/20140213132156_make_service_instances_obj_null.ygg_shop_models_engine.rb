# This migration comes from ygg_shop_models_engine (originally 20120918202020)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class MakeServiceInstancesObjNull < ActiveRecord::Migration
  def self.up
    change_column :shop_agreement_service_instances, :service_id, :integer, :null => true
    change_column :shop_agreement_service_instances, :service_type, :string, :limit => 32, :null => true
  end

  def self.down
  end
end
