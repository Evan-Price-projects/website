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

ActiveRecord::Schema.define(version: 2020_12_31_133535) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "status"
    t.string "cardFront"
    t.integer "UserID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "project_title"
    t.text "description"
    t.text "images"
  end

  create_table "tables", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "card_id"
    t.integer "user_id"
    t.integer "UserNum"
    t.integer "UserID"
    t.index ["card_id"], name: "index_tables_on_card_id"
    t.index ["user_id"], name: "index_tables_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "session_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
