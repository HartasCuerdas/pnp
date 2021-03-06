# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141004233200) do

  create_table "days", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "oTotal"
    t.integer  "dTotal"
    t.boolean  "wr"
    t.integer  "week_id"
  end

  add_index "days", ["week_id"], name: "index_days_on_week_id"

  create_table "ods", force: true do |t|
    t.datetime "instant"
    t.boolean  "o"
    t.boolean  "d"
    t.string   "timekey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_id"
  end

  add_index "ods", ["day_id"], name: "index_ods_on_day_id"

  create_table "weeks", force: true do |t|
    t.date     "firstDay"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "oAVG"
    t.float    "dAVG"
    t.integer  "oMAX"
    t.integer  "dMAX"
    t.integer  "oMIN"
    t.integer  "dMIN"
  end

end
