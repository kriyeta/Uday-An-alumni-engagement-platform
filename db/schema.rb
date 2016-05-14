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

ActiveRecord::Schema.define(version: 20160514084736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"
  enable_extension "unaccent"

  create_table "agenda_initiators", force: :cascade do |t|
    t.integer  "agenda_id"
    t.string   "name"
    t.integer  "initiator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "agendas", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.text     "solutions"
    t.integer  "comments_count"
    t.integer  "likes_count"
    t.integer  "dislikes_count"
    t.integer  "creator_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.datetime "authored_time"
    t.integer  "agenda_id"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "summary"
    t.string   "status"
    t.string   "event_type"
    t.string   "target_audiance"
    t.string   "organizers"
    t.string   "guests"
    t.date     "event_date"
    t.time     "event_from_time"
    t.time     "event_to_time"
    t.text     "venue"
    t.string   "image_path"
    t.text     "details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "refreshtoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.boolean  "status"
    t.datetime "status_time"
    t.integer  "agenda_id"
    t.integer  "author_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "name"
    t.string   "passout_school"
    t.string   "passout_year"
    t.string   "passout_class"
    t.string   "mobile"
    t.string   "current_city"
    t.string   "current_country"
    t.string   "current_zipcode"
    t.string   "current_address"
    t.string   "permanent_address"
    t.string   "current_occupation_status"
    t.string   "current_occupation_status_details"
    t.string   "preferred_time_of_contact"
    t.boolean  "admin",                             default: false
  end

  add_index "users", ["current_city"], name: "index_users_on_current_city", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["passout_year"], name: "index_users_on_passout_year", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "agenda_initiators", "agendas", column: "initiator_id"
  add_foreign_key "agendas", "users", column: "creator_id"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "identities", "users"
  add_foreign_key "likes", "users", column: "author_id"
end
