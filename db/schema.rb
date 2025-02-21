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

ActiveRecord::Schema[7.0].define(version: 2024_08_07_085946) do
  create_table "applies", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "stage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.index ["stage_id"], name: "index_applies_on_stage_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stage_id"
    t.integer "apply_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.text "message"
    t.string "bank"
    t.integer "branch"
    t.integer "account"
    t.integer "amount"
    t.integer "commission"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "stages", charset: "utf8mb4", force: :cascade do |t|
    t.string "title", null: false
    t.integer "month_id", null: false
    t.integer "day_id", null: false
    t.integer "show_hour_id", null: false
    t.integer "show_minute_id"
    t.integer "end_hour_id", null: false
    t.integer "end_minute_id"
    t.string "theater", null: false
    t.string "address", null: false
    t.text "conditions", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.integer "reward"
    t.index ["user_id"], name: "index_stages_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phonenumber", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birth_date"
    t.integer "age"
    t.string "gender"
    t.integer "money"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applies", "stages"
  add_foreign_key "applies", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "stages", "users"
end
