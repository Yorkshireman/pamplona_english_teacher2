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

ActiveRecord::Schema.define(version: 20150301133633) do

  create_table "group_memberships", force: :cascade do |t|
    t.string  "member_type"
    t.integer "member_id"
    t.integer "group_id"
    t.string  "group_name"
    t.string  "membership_type"
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id"
  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name"
  add_index "group_memberships", ["member_id", "member_type"], name: "index_group_memberships_on_member_id_and_member_type"

  create_table "groups", force: :cascade do |t|
    t.string "type"
  end

  create_table "materials", force: :cascade do |t|
    t.string   "level"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.integer  "user_id"
  end

  add_index "materials", ["user_id"], name: "index_materials_on_user_id"

  create_table "testimonials", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "testimonials", ["user_id", "created_at"], name: "index_testimonials_on_user_id_and_created_at"
  add_index "testimonials", ["user_id"], name: "index_testimonials_on_user_id"

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end