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

ActiveRecord::Schema.define(version: 20170323030350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "document_types", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "status",           default: 0
    t.string   "path"
    t.text     "note"
    t.integer  "document_type_id"
    t.integer  "player_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["document_type_id"], name: "index_documents_on_document_type_id", using: :btree
    t.index ["player_id"], name: "index_documents_on_player_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "value"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "cpf"
    t.string   "rg"
    t.string   "phones",                default: [],                array: true
    t.string   "email"
    t.string   "address_street"
    t.string   "address_number"
    t.string   "address_complement"
    t.string   "address_neighborhood"
    t.string   "address_cep"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "responsible_name"
    t.string   "responsible_cpf"
    t.string   "responsible_phones",    default: [],                array: true
    t.string   "responsible_email"
    t.string   "sport_name"
    t.string   "headquarter"
    t.date     "conclusion_date"
    t.date     "travel_date"
    t.string   "signing_situation"
    t.decimal  "signing_value"
    t.string   "signing_payment_mode"
    t.string   "advisory_situation"
    t.decimal  "advisory_value"
    t.string   "advisory_payment_mode"
    t.text     "advisory_notes"
    t.date     "plan_end_date"
    t.string   "platform_payment_mode"
    t.integer  "platform_parcels"
    t.text     "platform_notes"
    t.boolean  "active",                default: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "plan_id"
    t.index ["plan_id"], name: "index_players_on_plan_id", using: :btree
  end

  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "players"
  add_foreign_key "players", "plans"
end
