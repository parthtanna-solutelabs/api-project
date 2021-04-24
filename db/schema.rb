# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_24_082222) do

  create_table "addresses", force: :cascade do |t|
    t.text "address"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_number"
    t.date "expiry_date"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "disease_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doses", force: :cascade do |t|
    t.string "weight"
    t.integer "medicine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medicine_id"], name: "index_doses_on_medicine_id"
  end

  create_table "medical_conditions", force: :cascade do |t|
    t.string "name"
    t.integer "disease_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disease_id"], name: "index_medical_conditions_on_disease_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.text "side_effects"
    t.integer "medical_condition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["medical_condition_id"], name: "index_medicines_on_medical_condition_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "medicine_id"
    t.integer "dose_id"
    t.integer "pack_id"
    t.integer "address_id"
    t.integer "card_id"
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["card_id"], name: "index_orders_on_card_id"
    t.index ["dose_id"], name: "index_orders_on_dose_id"
    t.index ["medicine_id"], name: "index_orders_on_medicine_id"
    t.index ["pack_id"], name: "index_orders_on_pack_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "packs", force: :cascade do |t|
    t.integer "size"
    t.integer "price"
    t.integer "dose_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dose_id"], name: "index_packs_on_dose_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "admin", default: false
    t.string "mobile_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cards", "users"
  add_foreign_key "doses", "medicines"
  add_foreign_key "medical_conditions", "diseases"
  add_foreign_key "medicines", "medical_conditions"
  add_foreign_key "packs", "doses"
end
