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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121012160339) do

  create_table "games", :force => true do |t|
    t.string   "type"
    t.string   "league"
    t.string   "status"
    t.string   "display_status"
    t.string   "url"
    t.integer  "home_score"
    t.integer  "visitor_score"
    t.string   "channel"
    t.string   "reason"
    t.datetime "game_time"
    t.integer  "home_team_id"
    t.integer  "visitor_team_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "period_id"
  end

  create_table "periods", :force => true do |t|
    t.boolean  "is_default"
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sport_id"
    t.string   "period_id"
  end

  create_table "quotes", :force => true do |t|
    t.string   "content"
    t.string   "author"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "rank"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "nickname"
    t.string   "division"
    t.string   "league"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
