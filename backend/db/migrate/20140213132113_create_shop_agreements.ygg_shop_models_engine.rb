# This migration comes from ygg_shop_models_engine (originally 20100712115300)
#
# Copyright (C) 2008-2012, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CreateShopAgreements < ActiveRecord::Migration
  def self.up
    create_table :shop_agreements, :force => true do |t|
      t.string :uuid, :limit => 36, :null => false
      t.string :handle, :limit => 20, :null => false
      t.timestamps

      t.string :sti_type, :limit => 64, :null => false # Subclass name to implement STI

      # signer, customer, invoce
      t.references :signer
      t.references :customer_person
      t.references :customer_organization
      t.references :invoice_to_person
      t.references :invoice_to_organization

      # prices : upfront & per_day
      t.decimal :original_sale_price, :scale => 6, :precision => 14
      t.decimal :original_price_per_day, :scale => 6, :precision => 14

      # delta applied to prices
      t.decimal :delta_startup, :scale => 6, :precision => 14
      t.decimal :delta_per_day, :scale => 6, :precision => 14
      t.string :delta_reason, :null=>true
      t.boolean :delta_percentage, :default=>false

      # dates
      t.datetime :lock_to # product revision CAN NOT change before this date
      t.datetime :sale_date
      t.datetime :delivery_date
      t.datetime :expiration_date

      t.references :package, :null => false
      t.references :product_revision, :null => false

      # how many instaces are allowed and if is a single activation
      t.boolean :single_activation, :default=>false
      t.integer :max_instances, :default=>1

      t.text :product_attributes # contains the choosen attributes
      t.text :notes
    end

    create_table :shop_agreement_service_instances do |t|
      t.references :agreement, :null => false
      t.references :service, :polymorphic => true, :null => false

      t.timestamp :created_at
      t.datetime :delayed_activation, :null=>true
      t.datetime :activated_at, :null=>true
      t.datetime :delayed_deactivation, :null=>true
      t.string :state, :limit=>32
    end
    add_index :shop_agreement_service_instances, :agreement_id
    add_index :shop_agreement_service_instances, [ :service_type, :service_id ], :unique => true, :name => 'service'

    create_table :shop_agreement_suspensions do |t|
      t.references :agreement

      t.datetime :from_data
      t.datetime :to_data

      t.text :notes
    end
    add_index :shop_agreement_suspensions, :agreement_id
  end

  def self.down
    drop_table :shop_agreement_service_instances
    drop_table :shop_agreement_suspensions
    drop_table :shop_agreements
  end
end
