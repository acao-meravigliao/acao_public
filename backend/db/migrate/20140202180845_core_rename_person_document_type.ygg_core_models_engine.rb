# This migration comes from ygg_core_models_engine (originally 20131011141700)
#
# Copyright (C) 2013-2013, Intercom Srl, Daniele Orlandi
#
# Author:: Daniele Orlandi <daniele@orlandi.com>
#          Lele Forzani <lele@windmill.it>
#          Alfredo Cerutti <acerutti@intercom.it>
#
# License:: You can redistribute it and/or modify it under the terms of the LICENSE file.
#

class CoreRenamePersonDocumentType < ActiveRecord::Migration
  def self.up
    rename_column :core_people, :document_type, :id_document_type
    rename_column :core_people, :document_number, :id_document_number
  end
end
