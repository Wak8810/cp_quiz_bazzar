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

ActiveRecord::Schema[8.0].define(version: 2025_03_19_054726) do
  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_comments_on_quiz_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "quiz_options", force: :cascade do |t|
    t.boolean "correct", default: false, null: false
    t.integer "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content", null: false
    t.index ["quiz_id"], name: "index_quiz_options_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "hint"
    t.text "explanation", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "solved_quizzes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "quiz_id", null: false
    t.integer "quiz_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_solved_quizzes_on_quiz_id"
    t.index ["quiz_option_id"], name: "index_solved_quizzes_on_quiz_option_id"
    t.index ["user_id"], name: "index_solved_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
  end

  add_foreign_key "comments", "quizzes"
  add_foreign_key "comments", "users"
  add_foreign_key "quiz_options", "quizzes"
  add_foreign_key "quizzes", "users"
  add_foreign_key "solved_quizzes", "quiz_options"
  add_foreign_key "solved_quizzes", "quizzes"
  add_foreign_key "solved_quizzes", "users"
end
