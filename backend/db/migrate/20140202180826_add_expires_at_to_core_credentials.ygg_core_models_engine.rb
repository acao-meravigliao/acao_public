# This migration comes from ygg_core_models_engine (originally 20120111094320)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class AddExpiresAtToCoreCredentials < ActiveRecord::Migration
  def self.up
    add_column :core_credentials, :expires_at, :datetime
  end

  def self.down
    remove_column :core_credentials, :expires_at
  end
end
