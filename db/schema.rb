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

ActiveRecord::Schema.define(version: 20160212032138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktails", force: :cascade do |t|
    t.string "name",   null: false
    t.text   "recipe", null: false
    t.index ["name"], name: "index_cocktails_on_name", unique: true, using: :btree
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feeds_on_user_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_ingredients_on_name", unique: true, using: :btree
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ingredient_id"
    t.index ["ingredient_id"], name: "index_inventories_on_ingredient_id", using: :btree
    t.index ["user_id", "ingredient_id"], name: "index_inventories_on_user_id_and_ingredient_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_inventories_on_user_id", using: :btree
  end

  create_table "mixtures", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "cocktail_id"
    t.index ["cocktail_id", "ingredient_id"], name: "index_mixtures_on_cocktail_id_and_ingredient_id", unique: true, using: :btree
    t.index ["cocktail_id"], name: "index_mixtures_on_cocktail_id", using: :btree
    t.index ["ingredient_id"], name: "index_mixtures_on_ingredient_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "user_cocktails", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cocktail_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["cocktail_id"], name: "index_user_cocktails_on_cocktail_id", using: :btree
    t.index ["user_id", "cocktail_id"], name: "index_user_cocktails_on_user_id_and_cocktail_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_cocktails_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                     null: false
    t.string   "email",                                    null: false
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "feeds", "users"
  add_foreign_key "inventories", "ingredients"
  add_foreign_key "inventories", "users"
  add_foreign_key "mixtures", "cocktails"
  add_foreign_key "mixtures", "ingredients"
  add_foreign_key "user_cocktails", "cocktails"
  add_foreign_key "user_cocktails", "users"
end
