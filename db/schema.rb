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

ActiveRecord::Schema.define(:version => 20121127204123) do

  create_table "dialectics", :force => true do |t|
    t.integer  "route_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "offered_dates"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "description"
    t.integer  "favorited_count"
    t.boolean  "approved"
    t.integer  "minimum"
    t.integer  "maximum"
    t.string   "days"
    t.string   "times"
  end

  create_table "favorites", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "dialectic_id"
    t.integer  "user_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "lat"
    t.integer  "lng"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prerequisites", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "dialectic_id"
    t.string   "comment"
    t.string   "link"
    t.float    "lat"
    t.float    "lng"
    t.string   "ptype"
    t.string   "formatted_address"
    t.string   "icon"
    t.string   "name"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "routes", :force => true do |t|
    t.string   "route_number"
    t.string   "direction"
    t.string   "route_description"
    t.string   "direction_description"
    t.string   "transport_type"
    t.string   "stop_name"
    t.string   "jurisdiction"
    t.string   "frequent"
    t.integer  "location_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "stops", :force => true do |t|
    t.string   "name"
    t.string   "jurisdiction"
    t.string   "zipcode"
    t.integer  "location_id"
    t.integer  "route_id"
    t.integer  "sequence"
    t.integer  "kml_stop_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
