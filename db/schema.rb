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

ActiveRecord::Schema[7.0].define(version: 2023_02_15_061943) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.bigint "fan_id", null: false
    t.bigint "parlor_id", null: false
    t.datetime "last_viewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fan_id"], name: "index_enrollments_on_fan_id"
    t.index ["parlor_id"], name: "index_enrollments_on_parlor_id"
  end

  create_table "fans", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "fan_id", null: false
    t.bigint "parlor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fan_id"], name: "index_messages_on_fan_id"
    t.index ["parlor_id"], name: "index_messages_on_parlor_id"
  end

  create_table "parlors", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "fans"
  add_foreign_key "enrollments", "parlors"
  add_foreign_key "messages", "fans"
  add_foreign_key "messages", "parlors"
end
