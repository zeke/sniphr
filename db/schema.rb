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

ActiveRecord::Schema.define(:version => 20110420213628) do

  create_table "queries", :force => true do |t|
    t.string   "q"
    t.string   "user"
    t.string   "from_user"
    t.string   "ip"
    t.string   "all_params"
    t.integer  "num_results"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "queries", ["all_params"], :name => "index_queries_on_all_params"
  add_index "queries", ["from_user"], :name => "index_queries_on_from_user"
  add_index "queries", ["ip"], :name => "index_queries_on_ip"
  add_index "queries", ["num_results"], :name => "index_queries_on_num_results"
  add_index "queries", ["q"], :name => "index_queries_on_q"
  add_index "queries", ["user"], :name => "index_queries_on_user"
  add_index "queries", ["user_id"], :name => "index_queries_on_user_id"

  create_table "sniphs", :force => true do |t|
    t.string   "url"
    t.text     "content"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.boolean  "publique",   :default => true
    t.integer  "user_id"
  end

  add_index "sniphs", ["publique"], :name => "index_sniphs_on_publique"
  add_index "sniphs", ["title"], :name => "index_sniphs_on_title"
  add_index "sniphs", ["url"], :name => "index_sniphs_on_url"
  add_index "sniphs", ["user"], :name => "index_sniphs_on_user"
  add_index "sniphs", ["user_id"], :name => "index_sniphs_on_user_id"

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
  end

end
