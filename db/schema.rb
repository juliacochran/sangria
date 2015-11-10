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

ActiveRecord::Schema.define(version: 20151110192115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.integer  "stage"
    t.binary   "settings"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "board_id"
    t.integer  "company_id"
    t.integer  "category"
    t.date     "applied_date"
    t.string   "job"
  end

  add_index "applications", ["board_id"], name: "index_applications_on_board_id", using: :btree

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "glassdoor_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "company_id"
    t.string   "role"
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree

  create_table "interactions", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "details"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "application_id"
    t.integer  "category"
    t.integer  "contact_id"
    t.boolean  "followup",       default: false
  end

  add_index "interactions", ["application_id"], name: "index_interactions_on_application_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.text     "details"
    t.date     "remind_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "board_id"
  end

  add_index "notes", ["board_id"], name: "index_notes_on_board_id", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "seeking"
    t.binary   "settings"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "facebook_id"
    t.string   "google_id"
    t.string   "email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "applications", "boards"
  add_foreign_key "boards", "users"
  add_foreign_key "contacts", "companies"
  add_foreign_key "interactions", "applications"
  add_foreign_key "notes", "boards"
end
