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

ActiveRecord::Schema.define(version: 20160123130900) do

  create_table "abc_phrases", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.string   "meter",      limit: 255
    t.string   "length",     limit: 255
    t.string   "reference",  limit: 255
    t.string   "key",        limit: 255
    t.text     "abc",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "abc_phrases", ["user_id", "created_at"], name: "index_abc_phrases_on_user_id_and_created_at", using: :btree
  add_index "abc_phrases", ["user_id"], name: "index_abc_phrases_on_user_id", using: :btree

  create_table "abc_phrases_tags", force: :cascade do |t|
    t.integer  "abc_phrase_id", limit: 4
    t.integer  "tag_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "abc_phrases_tags", ["abc_phrase_id", "tag_id"], name: "index_abc_phrases_tags_on_abc_phrase_id_and_tag_id", unique: true, using: :btree
  add_index "abc_phrases_tags", ["abc_phrase_id"], name: "index_abc_phrases_tags_on_abc_phrase_id", using: :btree
  add_index "abc_phrases_tags", ["tag_id"], name: "index_abc_phrases_tags_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "abc_phrases", "users"
end
