# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "voli", primary_key: "id_voli", force: true do |t|
    t.datetime "data_volo",                                                         null: false
    t.integer  "codice_pilota_aereo",                                               null: false
    t.integer  "codice_secondo_pilota_aereo",                                       null: false
    t.integer  "codice_pilota_aliante",                                             null: false
    t.integer  "codice_secondo_pilota_aliante",                                     null: false
    t.string   "marche_aereo",                  limit: 8,                           null: false
    t.string   "marche_aliante",                limit: 8,                           null: false
    t.integer  "tipo_volo_club",                limit: 2,                           null: false
    t.integer  "tipo_aereo_aliante",            limit: 2,                           null: false
    t.datetime "ora_decollo_aereo",                                                 null: false
    t.datetime "ore_atterraggio_aereo",                                             null: false
    t.datetime "ora_atterraggio_aliante",                                           null: false
    t.integer  "durata_volo_aereo_minuti",                                          null: false
    t.integer  "durata_volo_aliante_minuti",                                        null: false
    t.integer  "quota",                         limit: 2,                           null: false
    t.decimal  "bollini_volo",                             precision: 18, scale: 2, null: false
    t.boolean  "check_chiuso",                                                      null: false
    t.string   "dep",                           limit: 10,                          null: false
    t.string   "arr",                           limit: 10,                          null: false
    t.integer  "num_att"
    t.datetime "data_att"
  end

end
