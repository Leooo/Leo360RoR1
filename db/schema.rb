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

ActiveRecord::Schema.define(:version => 20130108190648) do

  create_table "feedback_filleds", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feedback_filleds", ["profile_id", "user_id"], :name => "index_feedback_filleds_on_profile_id_and_user_id", :unique => true
  add_index "feedback_filleds", ["profile_id"], :name => "index_feedback_filleds_on_profile_id"
  add_index "feedback_filleds", ["user_id"], :name => "index_feedback_filleds_on_user_id"

  create_table "general_elements", :force => true do |t|
    t.integer  "feedback_filled_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "taxo_nationality_id"
    t.integer  "taxo_gender_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profiles", ["name"], :name => "index_profiles_on_name"

  create_table "taxo_genders", :force => true do |t|
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taxo_genders", ["gender"], :name => "index_taxo_genders_on_gender", :unique => true

  create_table "taxo_nationalities", :force => true do |t|
    t.string   "nationality"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
