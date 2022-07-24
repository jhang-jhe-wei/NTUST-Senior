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

ActiveRecord::Schema.define(version: 2022_07_24_070417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "leader"
    t.string "teacher"
    t.text "intro"
    t.string "url"
    t.string "updated_date"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_clubs_on_category_id"
  end

  create_table "course_times", force: :cascade do |t|
    t.string "section"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "place"
    t.index ["course_id"], name: "index_course_times_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "semester"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "category"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "google_calendars", force: :cascade do |t|
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opening_times", force: :cascade do |t|
    t.string "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "place_id"
  end

  create_table "places", id: :string, force: :cascade do |t|
    t.string "photo"
    t.string "name"
    t.string "star"
    t.string "address"
    t.string "google_map_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "notify_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_and_course_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_user_and_course_records_on_course_id"
    t.index ["user_id"], name: "index_user_and_course_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "line_id"
    t.string "name"
    t.string "image_url"
    t.string "line_notify_token"
    t.string "crosslink_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clubs", "categories"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_and_course_records", "courses"
  add_foreign_key "user_and_course_records", "users"
end
