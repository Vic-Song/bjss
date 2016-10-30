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

ActiveRecord::Schema.define(version: 20161029072049) do

  create_table "chapters", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "course_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "chapters", ["course_id"], name: "index_chapters_on_course_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "video_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "user_email", limit: 255
  end

  add_index "comments", ["video_id"], name: "index_comments_on_video_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "teacher",       limit: 255
    t.text     "teacher_intro", limit: 65535
    t.text     "description",   limit: 65535
    t.string   "thumbnail_url", limit: 255
    t.string   "trailer_url",   limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.integer  "course_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "user_email", limit: 255
  end

  add_index "posts", ["course_id"], name: "index_posts_on_course_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.string   "userinfo",   limit: 255
    t.string   "coursename", limit: 255
    t.datetime "trace"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "replies", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "user_email", limit: 255
  end

  add_index "replies", ["post_id"], name: "index_replies_on_post_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "userinfo",   limit: 255
    t.string   "coursename", limit: 255
    t.float    "one",        limit: 24
    t.float    "two",        limit: 24
    t.float    "three",      limit: 24
    t.float    "four",       limit: 24
    t.text     "words",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "video_url",   limit: 255
    t.string   "duration",    limit: 255
    t.string   "author",      limit: 255
    t.integer  "chapter_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "videos", ["chapter_id"], name: "index_videos_on_chapter_id", using: :btree

  add_foreign_key "chapters", "courses"
  add_foreign_key "comments", "videos"
  add_foreign_key "posts", "courses"
  add_foreign_key "replies", "posts"
  add_foreign_key "videos", "chapters"
end
