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

ActiveRecord::Schema.define(version: 20140611085022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "tenant_id"
    t.boolean  "is_valid",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_drivers", force: true do |t|
    t.integer  "bus_id"
    t.integer  "driver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_movements", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "bus_trip_id"
    t.string   "code"
    t.datetime "started_at"
    t.integer  "bus_id"
    t.integer  "can_book_before"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "time_started_at"
  end

  create_table "bus_services", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "bus_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bus_trips", force: true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "code"
    t.integer  "from_station_id"
    t.integer  "to_station_id"
    t.string   "photo"
    t.string   "desc"
    t.integer  "position"
    t.datetime "started_at"
    t.integer  "duration"
    t.boolean  "is_valid",         default: true
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_from_id"
    t.integer  "location_to_id"
    t.integer  "bus_id"
    t.float    "price_ticket"
    t.integer  "sub_seats"
  end

  create_table "buses", force: true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "code"
    t.string   "status"
    t.boolean  "is_valid",         default: true
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "has_bed",          default: 0
    t.integer  "current_location"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.boolean  "status",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "tenant_id"
    t.string   "fullname"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "driver_movements", force: true do |t|
    t.integer  "tenant_id"
    t.integer  "bus_movement_id"
    t.integer  "driver_id"
    t.datetime "movement_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", force: true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "code"
    t.string   "address"
    t.string   "phone"
    t.integer  "driver_type"
    t.boolean  "is_valid",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.string   "alias"
    t.text     "post_content"
    t.string   "post_desc"
    t.string   "meta_desc"
    t.string   "meta_key"
    t.boolean  "show_in_home_page", default: false
    t.boolean  "show_in_main_nav",  default: false
    t.boolean  "show_in_footer",    default: false
    t.boolean  "status",            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "services", force: true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.boolean  "is_valid",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "stations", force: true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "code"
    t.string   "photo"
    t.boolean  "is_valid",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "tenants", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "schema"
    t.string   "address"
    t.string   "email"
    t.string   "logo"
    t.string   "phone"
    t.string   "contact_person"
    t.boolean  "is_valid",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_types", force: true do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer "tenant_id"
    t.integer "bus_trip_id"
    t.string  "fullname"
    t.string  "phone"
    t.string  "email"
    t.string  "password"
    t.string  "promote_code"
    t.string  "pick_up_at"
    t.string  "status"
    t.string  "ticket_sale"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
