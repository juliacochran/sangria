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

ActiveRecord::Schema.define(version: 20150909004213) do

  create_table "applications", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "board_id"
    t.integer  "job_id"
    t.integer  "stage"
    t.integer  "type"
    t.binary   "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "website"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "role"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "title"
    t.integer  "type"
    t.date     "date"
    t.integer  "contact_id"
    t.text     "details"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "board_id"
    t.string   "title"
    t.text     "details"
    t.date     "remind_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "seeking"
    t.binary   "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
