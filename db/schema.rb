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

ActiveRecord::Schema.define(version: 20161117165500) do

  create_table "challenge", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "challenge_name", null: false
    t.string  "difficulty"
    t.integer "point_value"
    t.string  "picture"
    t.integer "event_id"
  end

  create_table "event", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "event_name",   null: false
    t.string  "bar_crawl",    null: false
    t.string  "start_time",   null: false
    t.integer "challenge_id"
    t.integer "team_id"
  end

  create_table "team", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "team_name", null: false
    t.string  "points"
    t.integer "event_id"
  end

  create_table "user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "user_name",     null: false
    t.string  "email",         null: false
    t.string  "password_hash", null: false
    t.integer "team_id"
  end

end
