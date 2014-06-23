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

ActiveRecord::Schema.define(version: 20140623154156) do

  create_table "admins", force: true do |t|
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

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "import_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_file_name"
    t.string   "data_file_content_type"
    t.integer  "data_file_file_size"
    t.datetime "data_file_updated_at"
    t.integer  "admins_id"
    t.integer  "admin_id"
  end

  add_index "import_sessions", ["admin_id"], name: "index_import_sessions_on_admin_id"
  add_index "import_sessions", ["admins_id"], name: "index_import_sessions_on_admins_id"

  create_table "imported_purchases", force: true do |t|
    t.integer  "import_session_id"
    t.integer  "purchase_id"
    t.integer  "line_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "description",                          null: false
    t.decimal  "price",       precision: 10, scale: 2, null: false
    t.integer  "merchant_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "quantity",     null: false
    t.integer  "purchaser_id", null: false
    t.integer  "item_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id"
  add_index "order_items", ["purchaser_id"], name: "index_order_items_on_purchaser_id"

  create_table "orders", force: true do |t|
    t.integer  "purchaser_id", null: false
    t.integer  "merchant_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["merchant_id"], name: "index_orders_on_merchant_id"
  add_index "orders", ["purchaser_id"], name: "index_orders_on_purchaser_id"

  create_table "purchasers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.integer  "item_id",      null: false
    t.integer  "quantity",     null: false
    t.integer  "purchaser_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchases", ["item_id"], name: "index_purchases_on_item_id"
  add_index "purchases", ["purchaser_id"], name: "index_purchases_on_purchaser_id"

end
