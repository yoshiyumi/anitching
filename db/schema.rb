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

ActiveRecord::Schema.define(version: 2021_09_12_102259) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "chats", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "room_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.integer "review_id"
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nicname"
    t.string "image_id"
    t.string "prefectures"
    t.string "introduction"
    t.integer "gender"
    t.boolean "is_active", default: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "matchings", force: :cascade do |t|
    t.integer "room_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.float "score"
    t.integer "number"
    t.float "point"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.integer "work_id"
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "thoughts"
    t.float "rate", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.integer "customer_id"
    t.integer "work_id"
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tagmaps", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "image_id"
    t.string "synopsis"
    t.string "release_date"
    t.integer "genre_id"
    t.integer "tag_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "update_at"
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

end
