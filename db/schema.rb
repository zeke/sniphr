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

ActiveRecord::Schema.define(:version => 20110416010422) do

  create_table "sniphs", :force => true do |t|
    t.string   "url"
    t.text     "content"
    t.string   "user"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "sniphs", ["title"], :name => "index_sniphs_on_title"
  add_index "sniphs", ["url"], :name => "index_sniphs_on_url"
  add_index "sniphs", ["user"], :name => "index_sniphs_on_user"

end
