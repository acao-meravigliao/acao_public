# This migration comes from ygg_core_models_engine (originally 20081002235923)
#
# Copyright (C) 2008-2011, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateCorePeople < ActiveRecord::Migration
  def self.up
    create_table :core_people do |t|
      t.string :uuid, :limit => 36, :null => false
      t.timestamps

      t.string     :title, :limit => 16
      t.string     :first_name, :limit => 64, :null => false
      t.string     :middle_name, :limit => 64
      t.string     :last_name, :limit => 64, :null => false
      t.string     :nickname, :limit => 32
      t.string     :gender, :limit => 1
      t.references :residence_location

      t.datetime   :birth_date
      t.references :birth_location

      t.string     :document_type
      t.string     :document_number

      t.references :invoicing_location

      t.string     :vat_number, :limit => 16
      t.string     :italian_fiscal_code, :limit => 16

      t.text :notes
      
      t.string  :handle
    end
  end

  def self.down
    drop_table :core_people
  end
end
