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

ActiveRecord::Schema.define(version: 20140821193043) do

  create_table "admin_groups", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_groups", ["user_id", "group_id"], name: "index_admin_groups_on_user_id_and_group_id", unique: true

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "type"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meeting_groups", force: true do |t|
    t.integer  "meeting_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meeting_groups", ["meeting_id", "group_id"], name: "index_meeting_groups_on_meeting_id_and_group_id", unique: true

  create_table "meetings", force: true do |t|
    t.date     "date"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_groups", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_groups", ["user_id", "group_id"], name: "index_member_groups_on_user_id_and_group_id", unique: true

  create_table "user_meetings", force: true do |t|
    t.integer  "user_id"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_meetings", ["user_id", "meeting_id"], name: "index_user_meetings_on_user_id_and_meeting_id", unique: true

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "rut"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
