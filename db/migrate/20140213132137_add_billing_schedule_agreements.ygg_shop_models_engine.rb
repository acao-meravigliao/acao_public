# This migration comes from ygg_shop_models_engine (originally 20120323171700)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddBillingScheduleAgreements < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :billing_active, :boolean, :default => false, :after => :expiration_date, :null => false
    add_column :shop_agreements, :billed_until, :datetime, :after => :billing_active, :null => true
  end

  def self.down
    remove_column :shop_agreements, :billed_until
    remove_column :shop_agreements, :billing_active
  end
end
