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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110217215432) do

  create_table "entries", :force => true do |t|
    t.integer  "schedule_id"
    t.string   "course_code"
    t.string   "course_name"
    t.string   "group_name"
    t.string   "course_type"
    t.integer  "week"
    t.integer  "week_day"
    t.integer  "start_hour"
    t.integer  "start_min"
    t.integer  "end_hour"
    t.integer  "end_min"
    t.string   "building"
    t.string   "room"
    t.string   "lecturer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.string   "hash"
    t.string   "year"
    t.integer  "semester"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
