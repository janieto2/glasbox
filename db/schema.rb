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

ActiveRecord::Schema.define(:version => 20130114214433) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.datetime "date_time"
    t.string   "location"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "user_id"
    t.string   "stripe_customer_token"
    t.integer  "plan_id"
  end

  add_index "memberships", ["user_id"], :name => "index_memberships_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "crypted_password",   :default => "", :null => false
    t.string   "password_salt",      :default => "", :null => false
    t.string   "persistence_token",  :default => "", :null => false
    t.string   "perishable_token",   :default => "", :null => false
    t.integer  "login_count",        :default => 0,  :null => false
    t.integer  "failed_login_count", :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], :name => "index_agents_on_email", :unique => true

end
