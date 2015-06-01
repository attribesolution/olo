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

ActiveRecord::Schema.define(version: 20150601065825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_owner_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image"
  end

  create_table "device_table_mappings", force: :cascade do |t|
    t.string   "device_id"
    t.string   "device_name"
    t.string   "table_number"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "restaurant_owner_id"
  end

  add_index "device_table_mappings", ["device_id"], name: "index_device_table_mappings_on_device_id", unique: true, using: :btree

  create_table "menu_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "menu_images", ["menu_id"], name: "index_menu_images_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.integer  "restaurant_owner_id"
    t.integer  "category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "menus", ["category_id"], name: "index_menus_on_category_id", using: :btree

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "menu_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "item_total", default: 0.0, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "table_no",                  null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "order_total", default: 0.0, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "api_key"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "menu_images", "menus"
  add_foreign_key "menus", "categories"
end
