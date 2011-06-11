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

ActiveRecord::Schema.define(:version => 20110112030844) do

  create_table "collections", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "message_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id",             :null => false
    t.integer  "commented_user_id",   :null => false
    t.integer  "message_id",          :null => false
    t.string   "user_nick_name",      :null => false
    t.string   "user_head_photo_url", :null => false
    t.string   "content",             :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forwards", :force => true do |t|
    t.integer  "user_id",            :null => false
    t.integer  "init_user_id",       :null => false
    t.integer  "init_message_id",    :null => false
    t.integer  "forward_message_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "content",                            :null => false
    t.string   "image"
    t.integer  "userid",                             :null => false
    t.string   "user_nick_name",                     :null => false
    t.string   "user_head_photo_url",                :null => false
    t.integer  "comment_count",       :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["created_at"], :name => "idx_messages_created_at"

  create_table "pictures", :force => true do |t|
    t.string "name"
    t.string "content_type"
    t.binary "data"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",                                        :null => false
    t.string   "nick_name",                                      :null => false
    t.integer  "sex",        :limit => 1, :default => 0,         :null => false
    t.string   "province",                :default => "Beijing", :null => false
    t.string   "city",                    :default => "Beijing", :null => false
    t.date     "birthday",                                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_link_users", :id => false, :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "linked_user_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                  :null => false
    t.string   "password",                                               :null => false
    t.string   "head_photo_url", :default => "/images/head/default.JPG", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
