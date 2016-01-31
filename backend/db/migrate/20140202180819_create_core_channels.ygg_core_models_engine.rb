# This migration comes from ygg_core_models_engine (originally 20090721073543)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCoreChannels < ActiveRecord::Migration
  def self.up
    create_table :core_channels do |t|
      t.timestamps
      t.integer :owner_id
      t.string  :owner_type, :limit => 127
      t.string  :channel_type # email, sms, phone, mobile, fax
      t.string  :value # the value
      t.text    :descr # description
      t.integer :preference, :default => 5 # greater value = best preference
    end

    # TODO: maybe too big and expensive ??
    add_index :core_channels, [:owner_type, :owner_id, :channel_type, :value], :unique => true, :name => 'channel_index'
  end

  def self.down
    drop_table :core_channels
  end
end
