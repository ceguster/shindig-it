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

ActiveRecord::Schema.define(version: 20141202022138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: true do |t|
    t.integer  "guest_id"
    t.integer  "event_id"
    t.string   "yummly_recipe_name"
    t.string   "yummly_id"
    t.string   "yummly_course"
    t.string   "yummly_cuisine_type"
    t.text     "yummly_ingredients"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "host_id"
    t.string   "name"
    t.text     "details"
    t.date     "date"
    t.time     "start_time"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tagline"
  end

  create_table "invitations", force: true do |t|
    t.integer  "event_id"
    t.integer  "guest_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guest_email"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
