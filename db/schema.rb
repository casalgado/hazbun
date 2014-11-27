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

ActiveRecord::Schema.define(version: 20141105170944) do

  create_table "appointment_types", force: true do |t|
    t.string   "appointment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: true do |t|
    t.integer  "prenda_id"
    t.integer  "customer_id"
    t.integer  "appointment_type_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "land_phone"
    t.string   "mobile_phone"
    t.string   "brand_name"
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

  add_index "brands", ["email"], name: "index_brands_on_email", unique: true
  add_index "brands", ["reset_password_token"], name: "index_brands_on_reset_password_token", unique: true

  create_table "customers", force: true do |t|
    t.integer  "brand_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "marriage"
    t.string   "workplace"
    t.string   "city"
    t.string   "land_phone"
    t.string   "mobile_phone"
    t.date     "date_of_birth"
    t.string   "id_number"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "picture"
  end

  add_index "customers", ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true

  create_table "item_types", force: true do |t|
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "occasion_id"
    t.integer  "item_type_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  create_table "measurements", force: true do |t|
    t.integer  "customer_id"
    t.string   "talle_frente"
    t.string   "talle_espalda"
    t.string   "imperio"
    t.string   "contorno"
    t.string   "espalda"
    t.string   "busto"
    t.string   "cintura"
    t.string   "cadera"
    t.string   "costado"
    t.string   "cotilla"
    t.string   "hombro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occasions", force: true do |t|
    t.string   "occasion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.boolean  "closed",      default: false
    t.integer  "total_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.integer  "order_id"
    t.datetime "date"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplies", force: true do |t|
    t.string   "supply_name"
    t.string   "supply_type"
    t.string   "supply_color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "supplies_per_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "supply_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
