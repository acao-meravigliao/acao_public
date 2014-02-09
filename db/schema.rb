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

ActiveRecord::Schema.define(version: 20140206122900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "core_acl_entries", force: true do |t|
    t.integer "group_id"
    t.integer "identity_id"
    t.integer "obj_id",                 null: false
    t.string  "obj_type",               null: false
    t.string  "capability",  limit: 32, null: false
  end

  add_index "core_acl_entries", ["group_id"], name: "index_core_acl_entries_on_group_id", using: :btree
  add_index "core_acl_entries", ["identity_id"], name: "index_core_acl_entries_on_identity_id", using: :btree
  add_index "core_acl_entries", ["obj_id", "obj_type"], name: "index_core_acl_entries_on_obj_id_and_obj_type", using: :btree

  create_table "core_capabilities", force: true do |t|
    t.string "name",  limit: 32, null: false
    t.string "descr"
  end

  add_index "core_capabilities", ["name"], name: "index_core_capabilities_on_name", using: :btree

  create_table "core_channels", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.string   "owner_type",   limit: 127
    t.string   "channel_type"
    t.string   "value"
    t.text     "descr"
    t.integer  "preference",               default: 5
  end

  create_table "core_contact_areas", force: true do |t|
    t.string  "name",      limit: 32
    t.text    "descr"
    t.integer "parent_id"
  end

  create_table "core_contact_roles", force: true do |t|
    t.string  "name",      limit: 32
    t.text    "descr"
    t.integer "parent_id"
  end

  create_table "core_contacts", force: true do |t|
    t.integer  "identity_id"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "contact_area_id"
    t.integer  "contact_role_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_credentials", force: true do |t|
    t.integer  "identity_id",                null: false
    t.string   "sti_type",        limit: 64, null: false
    t.text     "descr"
    t.text     "data",                       null: false
    t.string   "x509_m_serial",   limit: 32
    t.string   "x509_i_dn"
    t.string   "x509_s_dn"
    t.string   "x509_s_dn_cn"
    t.string   "x509_s_dn_email"
    t.datetime "expires_at"
  end

  add_index "core_credentials", ["identity_id", "sti_type"], name: "index_core_credentials_on_identity_id_and_sti_type", using: :btree
  add_index "core_credentials", ["identity_id"], name: "index_core_credentials_on_identity_id", using: :btree
  add_index "core_credentials", ["x509_i_dn", "x509_m_serial"], name: "index_core_credentials_on_x509_i_dn_and_x509_m_serial", unique: true, using: :btree
  add_index "core_credentials", ["x509_i_dn"], name: "index_core_credentials_on_x509_i_dn", using: :btree

  create_table "core_group_members", force: true do |t|
    t.integer "group_id"
    t.integer "identity_id"
  end

  create_table "core_groups", force: true do |t|
    t.string   "uuid",        limit: 36, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "symbol",      limit: 64
  end

  create_table "core_http_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",               limit: 36,                 null: false
    t.string   "remote_addr",        limit: 42
    t.integer  "remote_port"
    t.text     "x_forwarded_for"
    t.text     "via"
    t.string   "server_addr",        limit: 42
    t.integer  "server_port"
    t.string   "server_name",        limit: 64
    t.text     "referer"
    t.text     "user_agent"
    t.text     "request_uri"
    t.integer  "auth_credential_id"
    t.integer  "auth_identity_id"
    t.string   "auth_method",        limit: 32
    t.string   "auth_confidence",    limit: 16
    t.string   "status",             limit: 32, default: "new", null: false
    t.string   "close_reason",       limit: 32
    t.datetime "close_time"
  end

  add_index "core_http_sessions", ["updated_at"], name: "index_core_http_sessions_on_updated_at", using: :btree
  add_index "core_http_sessions", ["uuid"], name: "index_core_http_sessions_on_uuid", using: :btree

  create_table "core_identities", force: true do |t|
    t.integer "person_id"
    t.string  "qualified",  limit: 128, null: false
    t.string  "confidence", limit: 20
    t.string  "uuid",       limit: 36
    t.string  "extgui_gui", limit: 64
  end

  add_index "core_identities", ["person_id"], name: "index_core_identities_on_person_id", using: :btree
  add_index "core_identities", ["qualified"], name: "index_core_identities_on_qualified", unique: true, using: :btree

  create_table "core_identities_acl", force: true do |t|
    t.integer "obj_id",                 null: false
    t.integer "identity_id"
    t.integer "group_id"
    t.string  "capability",  limit: 64, null: false
  end

  add_index "core_identities_acl", ["capability"], name: "index_core_identities_acl_on_capability", using: :btree
  add_index "core_identities_acl", ["group_id"], name: "index_core_identities_acl_on_group_id", using: :btree
  add_index "core_identities_acl", ["identity_id"], name: "index_core_identities_acl_on_identity_id", using: :btree
  add_index "core_identities_acl", ["obj_id", "group_id", "capability"], name: "core_identities_acl_ogc", unique: true, using: :btree
  add_index "core_identities_acl", ["obj_id", "identity_id", "capability"], name: "core_identities_acl_oic", unique: true, using: :btree
  add_index "core_identities_acl", ["obj_id"], name: "index_core_identities_acl_on_obj_id", using: :btree

  create_table "core_identity_capabilities", force: true do |t|
    t.integer "identity_id"
    t.integer "capability_id"
  end

  add_index "core_identity_capabilities", ["capability_id"], name: "index_core_identity_capabilities_on_capability_id", using: :btree
  add_index "core_identity_capabilities", ["identity_id", "capability_id"], name: "core_identity_capabilities_j", unique: true, using: :btree
  add_index "core_identity_capabilities", ["identity_id"], name: "index_core_identity_capabilities_on_identity_id", using: :btree

  create_table "core_klasses", force: true do |t|
    t.string "name", limit: 128, null: false
  end

  create_table "core_klasses_acl", force: true do |t|
    t.integer "obj_id",                 null: false
    t.integer "identity_id"
    t.integer "group_id"
    t.string  "capability",  limit: 64, null: false
  end

  add_index "core_klasses_acl", ["capability"], name: "index_core_klasses_acl_on_capability", using: :btree
  add_index "core_klasses_acl", ["group_id"], name: "index_core_klasses_acl_on_group_id", using: :btree
  add_index "core_klasses_acl", ["identity_id"], name: "index_core_klasses_acl_on_identity_id", using: :btree
  add_index "core_klasses_acl", ["obj_id", "group_id", "capability"], name: "core_klasses_acl_ogc", unique: true, using: :btree
  add_index "core_klasses_acl", ["obj_id", "identity_id", "capability"], name: "core_klasses_acl_oic", unique: true, using: :btree
  add_index "core_klasses_acl", ["obj_id"], name: "index_core_klasses_acl_on_obj_id", using: :btree

  create_table "core_locations", force: true do |t|
    t.integer "locatable_id"
    t.string  "locatable_type", limit: 127
    t.string  "role",           limit: 32
    t.text    "street_address"
    t.string  "city",           limit: 64
    t.string  "state",          limit: 64
    t.string  "country_code",   limit: 2
    t.string  "zip",            limit: 12
    t.float   "lat"
    t.float   "lng"
    t.string  "provider",       limit: 16
    t.float   "accuracy"
    t.string  "location_type",  limit: 32
    t.string  "region",         limit: 128
  end

  create_table "core_log_entries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "timestamp",                   null: false
    t.string   "transaction_uuid", limit: 36
    t.integer  "person_id"
    t.integer  "identity_id"
    t.text     "description",                 null: false
    t.text     "notes"
    t.text     "extra_info"
    t.integer  "http_session_id"
  end

  add_index "core_log_entries", ["identity_id"], name: "index_core_log_entries_on_identity_id", using: :btree
  add_index "core_log_entries", ["person_id"], name: "index_core_log_entries_on_person_id", using: :btree
  add_index "core_log_entries", ["timestamp"], name: "index_core_log_entries_on_timestamp", using: :btree

  create_table "core_log_entry_details", force: true do |t|
    t.integer "log_entry_id"
    t.string  "operation",    limit: 32
    t.integer "obj_id"
    t.string  "obj_type"
    t.string  "obj_uuid",     limit: 36
    t.text    "obj_key"
    t.text    "obj_snapshot"
  end

  add_index "core_log_entry_details", ["log_entry_id"], name: "index_core_log_entry_details_on_log_entry_id", using: :btree
  add_index "core_log_entry_details", ["obj_id", "obj_type"], name: "index_core_log_entry_details_on_obj_id_and_obj_type", using: :btree

  create_table "core_notif_templates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",               limit: 36, null: false
    t.string   "symbol",             limit: 32, null: false
    t.text     "subject",                       null: false
    t.text     "body"
    t.text     "additional_headers"
  end

  create_table "core_notifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",       limit: 36, null: false
    t.datetime "timestamp",             null: false
    t.integer  "person_id"
    t.integer  "obj_id"
    t.string   "obj_type"
    t.string   "importance", limit: 32, null: false
    t.text     "subject"
    t.text     "body"
    t.text     "headers"
  end

  add_index "core_notifications", ["obj_type", "obj_id"], name: "index_core_notifications_on_obj_type_and_obj_id", using: :btree
  add_index "core_notifications", ["obj_type"], name: "index_core_notifications_on_obj_type", using: :btree
  add_index "core_notifications", ["person_id"], name: "index_core_notifications_on_person_id", using: :btree
  add_index "core_notifications", ["timestamp"], name: "index_core_notifications_on_timestamp", using: :btree

  create_table "core_organization_people", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id", null: false
    t.integer  "person_id",       null: false
    t.boolean  "is_signer"
  end

  add_index "core_organization_people", ["organization_id", "person_id"], name: "index_core_organization_people_on_organization_id_and_person_id", unique: true, using: :btree
  add_index "core_organization_people", ["organization_id"], name: "index_core_organization_people_on_organization_id", using: :btree
  add_index "core_organization_people", ["person_id"], name: "index_core_organization_people_on_person_id", using: :btree

  create_table "core_organizations", force: true do |t|
    t.string   "uuid",                          limit: 36, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                          limit: 3
    t.string   "name"
    t.integer  "headquarters_location_id"
    t.integer  "registered_office_location_id"
    t.integer  "invoicing_location_id"
    t.string   "vat_number",                    limit: 16
    t.string   "italian_fiscal_code",           limit: 16
    t.text     "notes"
    t.string   "handle"
    t.integer  "reseller_id"
    t.integer  "admin_group_id"
  end

  create_table "core_organizations_acl", force: true do |t|
    t.integer "obj_id",                 null: false
    t.integer "identity_id"
    t.integer "group_id"
    t.string  "capability",  limit: 64, null: false
  end

  add_index "core_organizations_acl", ["capability"], name: "index_core_organizations_acl_on_capability", using: :btree
  add_index "core_organizations_acl", ["group_id"], name: "index_core_organizations_acl_on_group_id", using: :btree
  add_index "core_organizations_acl", ["identity_id"], name: "index_core_organizations_acl_on_identity_id", using: :btree
  add_index "core_organizations_acl", ["obj_id", "group_id", "capability"], name: "core_organizations_acl_ogc", unique: true, using: :btree
  add_index "core_organizations_acl", ["obj_id", "identity_id", "capability"], name: "core_organizations_acl_oic", unique: true, using: :btree
  add_index "core_organizations_acl", ["obj_id"], name: "index_core_organizations_acl_on_obj_id", using: :btree

  create_table "core_people", force: true do |t|
    t.string   "uuid",                  limit: 36, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                 limit: 16
    t.string   "first_name",            limit: 64, null: false
    t.string   "middle_name",           limit: 64
    t.string   "last_name",             limit: 64, null: false
    t.string   "nickname",              limit: 32
    t.string   "gender",                limit: 1
    t.integer  "residence_location_id"
    t.datetime "birth_date"
    t.integer  "birth_location_id"
    t.string   "id_document_type"
    t.string   "id_document_number"
    t.integer  "invoicing_location_id"
    t.string   "vat_number",            limit: 16
    t.string   "italian_fiscal_code",   limit: 16
    t.text     "notes"
    t.string   "handle"
    t.integer  "reseller_id"
    t.integer  "acao_ext_id"
    t.integer  "acao_code"
  end

  add_index "core_people", ["acao_ext_id"], name: "index_core_people_on_acao_ext_id", unique: true, using: :btree

  create_table "core_people_acl", force: true do |t|
    t.integer "obj_id",                 null: false
    t.integer "identity_id"
    t.integer "group_id"
    t.string  "capability",  limit: 64, null: false
  end

  add_index "core_people_acl", ["capability"], name: "index_core_people_acl_on_capability", using: :btree
  add_index "core_people_acl", ["group_id"], name: "index_core_people_acl_on_group_id", using: :btree
  add_index "core_people_acl", ["identity_id"], name: "index_core_people_acl_on_identity_id", using: :btree
  add_index "core_people_acl", ["obj_id", "group_id", "capability"], name: "core_people_acl_ogc", unique: true, using: :btree
  add_index "core_people_acl", ["obj_id", "identity_id", "capability"], name: "core_people_acl_oic", unique: true, using: :btree
  add_index "core_people_acl", ["obj_id"], name: "index_core_people_acl_on_obj_id", using: :btree

  create_table "core_tasks", force: true do |t|
    t.string   "uuid",                limit: 36, null: false
    t.datetime "created_at"
    t.datetime "expected_completion"
    t.datetime "completed_at"
    t.string   "status",              limit: 32
    t.string   "description"
    t.integer  "obj_id"
    t.string   "obj_type"
    t.integer  "depends_on_id"
    t.string   "subsystem",           limit: 32
    t.string   "node",                limit: 64
    t.string   "operation",           limit: 32
    t.text     "request_data"
    t.text     "result_data"
    t.text     "log"
    t.integer  "precent"
    t.float    "percent"
  end

  add_index "core_tasks", ["depends_on_id"], name: "index_core_tasks_on_depends_on_id", using: :btree
  add_index "core_tasks", ["obj_type", "obj_id"], name: "index_core_tasks_on_obj_type_and_obj_id", using: :btree
  add_index "core_tasks", ["status"], name: "index_core_tasks_on_status", using: :btree
  add_index "core_tasks", ["uuid"], name: "index_core_tasks_on_uuid", unique: true, using: :btree

  create_table "flights", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",                       limit: 36,                          null: false
    t.integer  "acao_ext_id",                                                    null: false
    t.integer  "plane_pilot1_id"
    t.integer  "plane_pilot2_id"
    t.integer  "towplane_pilot1_id"
    t.integer  "towplane_pilot2_id"
    t.integer  "plane_id",                                                       null: false
    t.integer  "towplane_id",                                                    null: false
    t.datetime "takeoff_at"
    t.datetime "landing_at"
    t.datetime "towplane_landing_at"
    t.integer  "tipo_volo_club"
    t.integer  "tipo_aereo_aliante"
    t.integer  "durata_volo_aereo_minuti"
    t.integer  "durata_volo_aliante_minuti"
    t.integer  "quota"
    t.decimal  "bollini_volo",                          precision: 10, scale: 2
    t.boolean  "check_chiuso"
    t.string   "dep",                        limit: 64
    t.string   "arr",                        limit: 64
    t.integer  "num_att"
    t.datetime "data_att"
  end

  create_table "planes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uuid",                   limit: 36, null: false
    t.string   "flarm_code",             limit: 16
    t.string   "owner_name"
    t.string   "home_airport"
    t.string   "type_name"
    t.string   "race_registration"
    t.string   "registration"
    t.string   "common_radio_frequency"
  end

  add_index "planes", ["flarm_code"], name: "index_planes_on_flarm_code", unique: true, using: :btree
  add_index "planes", ["uuid"], name: "index_planes_on_uuid", unique: true, using: :btree

end
