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

ActiveRecord::Schema.define(version: 2022_06_21_070710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_orders", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "book_quantity", default: 1
    t.index ["book_id"], name: "index_book_orders_on_book_id"
    t.index ["order_id"], name: "index_book_orders_on_order_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "discription"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date", default: -> { "now()" }
    t.datetime "expiry_date"
    t.integer "discount_method", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "piece", default: 1
    t.string "status", default: "published"
    t.bigint "order_id"
    t.index ["order_id"], name: "index_coupons_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pended"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_coupons", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coupon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_user_coupons_on_coupon_id"
    t.index ["user_id"], name: "index_user_coupons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "book_orders", "books"
  add_foreign_key "book_orders", "orders"
  add_foreign_key "coupons", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "user_coupons", "coupons"
  add_foreign_key "user_coupons", "users"
end
