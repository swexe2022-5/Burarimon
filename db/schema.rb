# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_23_063917) do

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "prefecture"
    t.string "text"
    t.string "url"
    t.string "genre"
    t.string "open_time"
    t.string "contact"
    t.integer "user_id"
    t.datetime "time"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "text"
    t.datetime "time"
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "pass"
    t.string "profile"
    t.binary "icon"
    t.boolean "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
