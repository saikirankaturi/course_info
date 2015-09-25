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

ActiveRecord::Schema.define(:version => 20150704111717) do

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "ind"
    t.integer  "ind_blog"
    t.string   "org_content"
    t.string   "mod_content"
    t.string   "org_total_credits"
    t.string   "org_type"
    t.string   "org_lecture_credits"
    t.string   "org_tutorial"
    t.string   "org_practical"
    t.string   "org_half_semester"
    t.string   "org_text_reference"
    t.string   "mod_total_credits"
    t.string   "mod_type"
    t.string   "mod_lecture_credits"
    t.string   "mod_tutorial"
    t.string   "mod_practical"
    t.string   "mod_half_semester"
    t.string   "mod_text_reference"
    t.string   "course_code"
    t.string   "org_prerequisite"
    t.string   "org_self_study"
    t.string   "mod_prerequisite"
    t.string   "mod_self_study"
  end

  create_table "posts", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "comment"
    t.string   "ind"
    t.string   "name"
    t.string   "email"
    t.string   "prof_student"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "course"
    t.string   "prof_student"
    t.string   "name"
  end

end
