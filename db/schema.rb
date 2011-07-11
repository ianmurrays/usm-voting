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

ActiveRecord::Schema.define(:version => 20110711171522) do

  create_table "alternatives", :force => true do |t|
    t.string   "description"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ballots", :force => true do |t|
    t.integer  "alternative_id"
    t.integer  "user_id"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.string   "question"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "uid"
    t.string   "name"
    t.string   "last_name"
    t.string   "rol"
    t.string   "rut"
    t.string   "carreer"
    t.boolean  "registered", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      :default => false
  end

end
