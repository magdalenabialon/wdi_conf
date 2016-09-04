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

ActiveRecord::Schema.define(version: 20160902031304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "afterevents", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "lat"
    t.string   "long"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_afterevents_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.string   "seat"
    t.integer  "speech_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["speech_id"], name: "index_bookings_on_speech_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "prompt"
    t.text     "problem"
    t.text     "answer1"
    t.text     "answer2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "speeches", force: :cascade do |t|
    t.string   "name"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "speaker"
    t.string   "theme"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "quizscore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "image_url"
    t.string   "imageurl"
    t.text     "image_url"
  end

  add_foreign_key "afterevents", "users"
  add_foreign_key "bookings", "speeches"
  add_foreign_key "bookings", "users"
end
