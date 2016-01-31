# This migration comes from ygg_core_models_engine (originally 20120619130224)
#
# Copyright (C) 2012-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AlterHttpSessionStatusDefault < ActiveRecord::Migration
  def self.up
    change_column :core_http_sessions, :status, :string, :limit => 32, :default => 'new'
  end

  def self.down
  end
end
