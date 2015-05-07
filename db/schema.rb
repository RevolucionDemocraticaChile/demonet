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

ActiveRecord::Schema.define(version: 20150430235448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_groups", ["user_id", "group_id"], name: "index_admin_groups_on_user_id_and_group_id", unique: true, using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "desc",       limit: 255
    t.string   "type",       limit: 255
    t.string   "state",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meeting_groups", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meeting_groups", ["meeting_id", "group_id"], name: "index_meeting_groups_on_meeting_id_and_group_id", unique: true, using: :btree

  create_table "meetings", force: :cascade do |t|
    t.date     "date"
    t.string   "desc",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      limit: 255
    t.text     "minutes"
    t.string   "place",      limit: 255
    t.string   "title",      limit: 255
    t.datetime "start"
    t.datetime "finish"
  end

  create_table "member_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_groups", ["user_id", "group_id"], name: "index_member_groups_on_user_id_and_group_id", unique: true, using: :btree

  create_table "opinions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.integer  "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "opinions", ["poll_id"], name: "index_opinions_on_poll_id", using: :btree
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "amount"
    t.date     "date"
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start"
    t.datetime "finish"
    t.string   "options"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_meetings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_meetings", ["user_id", "meeting_id"], name: "index_user_meetings_on_user_id_and_meeting_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               limit: 255
    t.string   "name",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",     limit: 255
    t.string   "remember_token",      limit: 255
    t.boolean  "admin"
    t.string   "first_name",          limit: 255
    t.string   "second_name",         limit: 255
    t.string   "last_name",           limit: 255
    t.string   "rut",                 limit: 255
    t.string   "reset_digest",        limit: 255
    t.datetime "reset_sent_at"
    t.date     "birthdate"
    t.string   "city",                limit: 255
    t.text     "description"
    t.string   "mobile_number",       limit: 255
    t.string   "twitter_user",        limit: 255
    t.date     "active_member_until"
    t.integer  "roles_mask"
    t.string   "display_name",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "admin_groups", "groups"
  add_foreign_key "admin_groups", "users"
  add_foreign_key "opinions", "polls"
  add_foreign_key "opinions", "users"
end
