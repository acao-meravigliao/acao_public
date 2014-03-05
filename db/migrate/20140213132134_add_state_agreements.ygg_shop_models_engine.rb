# This migration comes from ygg_shop_models_engine (originally 20120307152400)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddStateAgreements < ActiveRecord::Migration
  def self.up
    add_column :shop_agreements, :state, :string, :limit=>32
  end

  def self.down
    remove_column :shop_agreements, :state
  end

end
