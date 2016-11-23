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

ActiveRecord::Schema.define(version: 20161115021502) do

  create_table "comment_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["user_id"], name: "index_comment_likes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "dare_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dare_id"], name: "index_comments_on_dare_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dare_submissions", force: :cascade do |t|
    t.text     "content"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "dare_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["dare_id"], name: "index_dare_submissions_on_dare_id"
    t.index ["user_id"], name: "index_dare_submissions_on_user_id"
  end

  create_table "dares", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "karma_offer"
    t.integer  "winning_submission_id"
    t.index ["user_id", "created_at"], name: "index_dares_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_dares_on_user_id"
    t.index ["winning_submission_id"], name: "index_dares_on_winning_submission_id"
  end

  create_table "submission_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dare_submission_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["dare_submission_id"], name: "index_submission_likes_on_dare_submission_id"
    t.index ["user_id"], name: "index_submission_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "karma_points",           default: 100
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
