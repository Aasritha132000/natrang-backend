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

ActiveRecord::Schema[8.1].define(version: 2026_04_02_040942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "dance_id", null: false
    t.date "date"
    t.string "level"
    t.string "notes"
    t.string "status"
    t.string "time_slot"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["dance_id"], name: "index_bookings_on_dance_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "dance_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "dances", force: :cascade do |t|
    t.text "costumes"
    t.datetime "created_at", null: false
    t.string "dance_type"
    t.text "description"
    t.text "history"
    t.string "image_url"
    t.text "instruments"
    t.text "mudras"
    t.string "name"
    t.string "origin_year"
    t.string "region"
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "video_id"
  end

  create_table "quiz_scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "dance_id"
    t.integer "score"
    t.integer "total"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.integer "dance_id"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "option_d"
    t.text "question"
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.integer "dance_id"
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.boolean "is_admin"
    t.string "name"
    t.string "password_digest"
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "dance_id", null: false
    t.string "duration"
    t.string "level"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "youtube_url"
    t.index ["dance_id"], name: "index_videos_on_dance_id"
  end

  add_foreign_key "bookings", "dances"
  add_foreign_key "bookings", "users"
  add_foreign_key "videos", "dances"
end
