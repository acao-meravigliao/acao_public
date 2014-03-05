# This migration comes from ygg_shop_models_engine (originally 20120615174400)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class RemovePreferredPeriodColumns < ActiveRecord::Migration
  def self.up
    remove_column :shop_agreements, :prices_period
  end

  def self.down
  end
end
