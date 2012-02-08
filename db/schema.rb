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

ActiveRecord::Schema.define(:version => 20120208211357) do

  create_table "queries", :force => true do |t|
    t.string   "q"
    t.string   "ip"
    t.integer  "num_results"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "queries", ["ip"], :name => "index_queries_on_ip"
  add_index "queries", ["num_results"], :name => "index_queries_on_num_results"
  add_index "queries", ["q"], :name => "index_queries_on_q"
  add_index "queries", ["user_id"], :name => "index_queries_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sniphs", :force => true do |t|
    t.string   "url"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "publique",                  :default => true
    t.integer  "user_id"
    t.datetime "last_tagging_attempted_at"
    t.text     "cached_tag_list"
  end

  add_index "sniphs", ["last_tagging_attempted_at"], :name => "index_sniphs_on_tagged_at"
  add_index "sniphs", ["publique"], :name => "index_sniphs_on_publique"
  add_index "sniphs", ["title"], :name => "index_sniphs_on_title"
  add_index "sniphs", ["url"], :name => "index_sniphs_on_url"
  add_index "sniphs", ["user_id"], :name => "index_sniphs_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"
  add_index "taggings", ["taggable_id"], :name => "index_taggings_on_taggable_id"
  add_index "taggings", ["taggable_type"], :name => "index_taggings_on_taggable_type"
  add_index "taggings", ["tagger_id"], :name => "index_taggings_on_tagger_id"
  add_index "taggings", ["tagger_type"], :name => "index_taggings_on_tagger_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "name"
    t.string   "location"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mode",        :default => "private"
    t.string   "email"
    t.string   "fb_url"
  end

end
