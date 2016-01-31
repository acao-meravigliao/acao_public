# This migration comes from ygg_core_models_engine (originally 20130926155600)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreRemovePersonEmail < ActiveRecord::Migration
  def self.up
    remove_column :core_people, :email
  end
end