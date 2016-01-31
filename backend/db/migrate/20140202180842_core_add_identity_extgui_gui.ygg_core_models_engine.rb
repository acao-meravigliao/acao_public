# This migration comes from ygg_core_models_engine (originally 20130913191700)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreAddIdentityExtguiGui < ActiveRecord::Migration
  def self.up
    add_column :core_identities, :extgui_gui, :string, :limit => 64
  end
end
