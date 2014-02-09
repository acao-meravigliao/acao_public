# This migration comes from ygg_core_models_engine (originally 20121008185300)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class MakePercentFloat < ActiveRecord::Migration
  def self.up
    add_column :core_tasks, :percent, :float
  end
end
