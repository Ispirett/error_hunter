# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_050916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_errors", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "serverity"
    t.bigint "app_id", null: false
    t.string "app_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "developer_id"
    t.string "status", default: "not_solved"
    t.string "log"
    t.index ["app_id"], name: "index_app_errors_on_app_id"
    t.index ["app_name"], name: "index_app_errors_on_app_name"
    t.index ["status"], name: "index_app_errors_on_status"
  end

  create_table "apps", force: :cascade do |t|
    t.integer "ceo_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_apps_on_name", unique: true
  end

  create_table "developer_apps", force: :cascade do |t|
    t.integer "developer_id"
    t.integer "app_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "errors", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "serverity"
    t.bigint "app_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "app_name"
    t.index ["app_id"], name: "index_errors_on_app_id"
    t.index ["app_name"], name: "index_errors_on_app_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "app_errors", "apps"
  add_foreign_key "errors", "apps"
end
