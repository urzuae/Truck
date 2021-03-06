# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101005134828) do

  create_table "developers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "github_login"
    t.string   "github_token"
    t.string   "pivotal_login"
    t.string   "pivotal_token"
    t.string   "basecamp_login"
    t.string   "basecamp_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "repo_name"
    t.string   "pivotal_id"
    t.string   "github_owner"
    t.string   "basecamp_url"
    t.string   "basecamp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
