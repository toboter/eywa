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

ActiveRecord::Schema.define(:version => 20121213142624) do

  create_table "accounts", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "fullname"
    t.string   "public_email"
    t.string   "url"
    t.string   "institution"
    t.string   "location"
    t.text     "interests"
    t.string   "type"
    t.boolean  "deactivated"
  end

  create_table "contexts", :force => true do |t|
    t.integer  "project_id"
    t.integer  "definition_id"
    t.integer  "version_id"
    t.string   "name"
    t.hstore   "properties"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "definitions", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.string   "ancestry"
    t.text     "comment"
    t.boolean  "metaclass"
    t.string   "approved_since_version"
    t.string   "deprecated_since_version"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "content"
    t.string   "predicate"
  end

  add_index "definitions", ["ancestry"], :name => "index_definitions_on_ancestry"

  create_table "descriptions", :force => true do |t|
    t.integer  "definition_id"
    t.string   "predicate"
    t.string   "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "fellowships", :force => true do |t|
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "role"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "shortcut"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "slug"
    t.text     "description"
    t.integer  "owner_id"
    t.boolean  "basic"
    t.string   "xmlns_url"
    t.string   "project_url"
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug"

end
