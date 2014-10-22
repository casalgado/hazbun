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

ActiveRecord::Schema.define(version: 20141016153159) do

  create_table "abonos", force: true do |t|
    t.integer  "orden_id"
    t.datetime "fecha"
    t.integer  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "citas", force: true do |t|
    t.integer  "prenda_id"
    t.integer  "clienta_id"
    t.integer  "tipo_de_cita_id"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientas", force: true do |t|
    t.integer  "marca_id"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "telefono"
    t.date     "fecha_de_nacimiento"
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
  end

  add_index "clientas", ["confirmation_token"], name: "index_clientas_on_confirmation_token", unique: true
  add_index "clientas", ["email"], name: "index_clientas_on_email", unique: true
  add_index "clientas", ["reset_password_token"], name: "index_clientas_on_reset_password_token", unique: true

  create_table "insumos", force: true do |t|
    t.string   "tipo_de_insumo"
    t.integer  "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prenda_id"
  end

  create_table "marcas", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "marca"
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

  add_index "marcas", ["email"], name: "index_marcas_on_email", unique: true
  add_index "marcas", ["reset_password_token"], name: "index_marcas_on_reset_password_token", unique: true

  create_table "materiales", force: true do |t|
    t.integer  "tipo_de_material_id"
    t.integer  "color_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "materiales_por_prendas", force: true do |t|
    t.integer  "prenda_id"
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medidas", force: true do |t|
    t.integer  "clienta_id"
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

  create_table "ocasiones", force: true do |t|
    t.string   "ocasion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordenes", force: true do |t|
    t.integer  "clienta_id"
    t.boolean  "cerrada",     default: false
    t.integer  "valor_total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prendas", force: true do |t|
    t.integer  "ocasion_id"
    t.integer  "tipo_de_prenda_id"
    t.integer  "orden_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_de_citas", force: true do |t|
    t.string   "tipo_de_cita"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_de_prendas", force: true do |t|
    t.string   "tipo_de_prenda"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
