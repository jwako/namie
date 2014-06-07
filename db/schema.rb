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

ActiveRecord::Schema.define(version: 20140607100044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supporter_areas", force: true do |t|
    t.integer  "supporter_id", null: false
    t.integer  "area_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supporter_areas", ["area_id"], name: "index_supporter_areas_on_area_id", using: :btree
  add_index "supporter_areas", ["supporter_id"], name: "index_supporter_areas_on_supporter_id", using: :btree

  create_table "supporter_commissions", force: true do |t|
    t.integer  "supporter_id",  null: false
    t.integer  "commission_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supporter_commissions", ["commission_id"], name: "index_supporter_commissions_on_commission_id", using: :btree
  add_index "supporter_commissions", ["supporter_id"], name: "index_supporter_commissions_on_supporter_id", using: :btree

  create_table "supporter_profiles", force: true do |t|
    t.integer  "supporter_id",  null: false
    t.string   "profile_image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "supporter_profiles", ["supporter_id"], name: "index_supporter_profiles_on_supporter_id", using: :btree

  create_table "supporter_services", force: true do |t|
    t.integer  "supporter_id", null: false
    t.integer  "week_id",      null: false
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supporter_services", ["supporter_id"], name: "index_supporter_services_on_supporter_id", using: :btree
  add_index "supporter_services", ["week_id"], name: "index_supporter_services_on_week_id", using: :btree

  create_table "supporters", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supporters", ["email"], name: "index_supporters_on_email", unique: true, using: :btree
  add_index "supporters", ["reset_password_token"], name: "index_supporters_on_reset_password_token", unique: true, using: :btree

  create_table "user_profiles", force: true do |t|
    t.integer  "user_id",       null: false
    t.string   "profile_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weeks", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_commissions", force: true do |t|
    t.integer  "work_id",       null: false
    t.integer  "commission_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_commissions", ["commission_id"], name: "index_work_commissions_on_commission_id", using: :btree
  add_index "work_commissions", ["work_id"], name: "index_work_commissions_on_work_id", using: :btree

  create_table "works", force: true do |t|
    t.integer  "user_id",          null: false
    t.integer  "supporter_id",     null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "url_token"
    t.integer  "review_point"
    t.text     "greeting_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.boolean  "is_finished"
  end

  add_index "works", ["supporter_id"], name: "index_works_on_supporter_id", using: :btree
  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

end
