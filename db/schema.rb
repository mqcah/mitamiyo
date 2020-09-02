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

ActiveRecord::Schema.define(version: 2020_09_02_063923) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "movie_id"], name: "index_bookmarks_on_customer_id_and_movie_id", unique: true
    t.index ["customer_id"], name: "index_bookmarks_on_customer_id"
    t.index ["movie_id"], name: "index_bookmarks_on_movie_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.string "customer_name"
    t.text "profile"
    t.string "image_id"
    t.boolean "customer_status", default: true, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "follow_relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_follow_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_follow_relationships_on_follower_id"
    t.index ["following_id"], name: "index_follow_relationships_on_following_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_genre_relations", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.integer "customer_id"
    t.string "customer_name", default: ""
    t.string "title", default: ""
    t.text "impression"
    t.float "rate", default: 3.0
    t.string "movie_image_id"
    t.boolean "netflix", default: true
    t.boolean "amazon", default: true
    t.boolean "hulu", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "follow_id"], name: "index_relationships_on_customer_id_and_follow_id", unique: true
    t.index ["customer_id"], name: "index_relationships_on_customer_id"
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
  end

end
