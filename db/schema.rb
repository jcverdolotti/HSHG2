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

ActiveRecord::Schema.define(version: 20181205210242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_petitions", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "minBid"
    t.decimal "startPrice"
    t.decimal "price"
    t.date "startDate"
    t.date "endDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "petitions", force: :cascade do |t|
    t.string "email"
    t.integer "current_uType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residences", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "location"
    t.string "province"
    t.string "description"
    t.date "date"
    t.decimal "cost"
    t.integer "people_amount"
    t.boolean "logic_delete"
    t.boolean "reserved"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "userType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "last_name"
    t.string "genre"
    t.integer "age"
    t.string "card_number"
    t.string "card_SC"
    t.date "card_expDate"
    t.integer "user_type", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.boolean "reserved", default: false
    t.integer "residence_id"
    t.date "weekDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
