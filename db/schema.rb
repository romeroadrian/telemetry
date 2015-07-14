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

ActiveRecord::Schema.define(version: 20150714190146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer  "installation_id"
    t.string   "kind"
    t.text     "payload"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "events", ["installation_id"], name: "index_events_on_installation_id", using: :btree

  create_table "installations", force: :cascade do |t|
    t.string   "uuid"
    t.datetime "last_reported_at"
    t.string   "ip"
    t.string   "lat"
    t.string   "lng"
    t.string   "admin_email"
    t.string   "application"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "installations", ["uuid"], name: "index_installations_on_uuid", using: :btree

  add_foreign_key "events", "installations"
end
