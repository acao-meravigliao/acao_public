# This migration comes from ygg_shop_models_engine (originally 20121115174401)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddServiceLabelToAgreementInstances < ActiveRecord::Migration
  def self.up
    add_column :shop_agreement_service_instances, :service_label, :string, :limit => 64
    Ygg::Shop::Agreement::Service::Instance.all.each { |i| i.copy_service_label; i.save! }
  end

  def self.down
    remove_column :shop_agreement_service_instances, :service_label
  end
end