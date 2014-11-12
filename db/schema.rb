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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141111215841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_plans", force: true do |t|
    t.integer  "client_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "action_plans", ["client_id"], name: "index_action_plans_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "phone",         null: false
    t.string   "salesforce_id", null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "goals", force: true do |t|
    t.integer  "action_plan_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["action_plan_id"], name: "index_goals_on_action_plan_id", using: :btree

  create_table "steps", force: true do |t|
    t.integer  "goal_id"
    t.text     "description"
    t.date     "due_by"
    t.boolean  "complete",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["goal_id"], name: "index_steps_on_goal_id", using: :btree

  create_table "text_messages", force: true do |t|
    t.integer  "client_id"
    t.text     "content"
    t.boolean  "incoming_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "scheduled_date"
  end

  add_index "text_messages", ["client_id"], name: "index_text_messages_on_client_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "title"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
