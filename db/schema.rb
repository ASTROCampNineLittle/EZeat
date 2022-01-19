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

ActiveRecord::Schema.define(version: 2022_01_18_015946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "tel"
    t.string "manager_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "companies_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comapny_id"
    t.index ["comapny_id"], name: "index_companies_users_on_comapny_id"
    t.index ["user_id"], name: "index_companies_users_on_user_id"
  end

  create_table "dish_images", force: :cascade do |t|
    t.integer "dish_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_dish_images_on_dish_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.string "name"
    t.integer "price"
    t.boolean "status"
    t.text "intro"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_dishes_on_store_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "open_date_id", null: false
    t.time "availible_time"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["open_date_id"], name: "index_offers_on_open_date_id"
  end

  create_table "open_dates", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.date "availible_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_id"], name: "index_open_dates_on_dish_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "open_date_id", null: false
    t.string "name"
    t.string "tel"
    t.string "email"
    t.string "order_dish"
    t.string "order_number"
    t.date "order_date"
    t.string "order_time"
    t.integer "order_people"
    t.integer "ezeat_amount"
    t.string "order_status"
    t.bigint "newebpay_amount"
    t.string "newebpay_time"
    t.integer "newebpay_number"
    t.bigint "newebpay_card6no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_email"
    t.string "ticket"
    t.bigint "user_id"
    t.bigint "store_id"
    t.index ["open_date_id"], name: "index_orders_on_open_date_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.integer "food_type"
    t.string "tel"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.text "intro"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.time "open_time"
    t.time "close_time"
    t.index ["company_id"], name: "index_stores_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "tel"
    t.integer "gender"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.string "provider"
    t.string "uid"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "dishes", "stores"
  add_foreign_key "offers", "open_dates"
  add_foreign_key "open_dates", "dishes"
  add_foreign_key "orders", "open_dates"
  add_foreign_key "orders", "stores"
  add_foreign_key "orders", "users"
  add_foreign_key "stores", "companies"
  add_foreign_key "users", "companies"
end
