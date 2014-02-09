# This migration comes from ygg_core_models_engine (originally 20121228182900)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreAddIndexToTasks < ActiveRecord::Migration
  def self.up
    add_index :core_tasks, :status
    add_index :core_tasks, :depends_on_id
  end

  def self.down
    remove_index :core_tasks, :depends_on_id
    remove_index :core_tasks, :status
  end
end
