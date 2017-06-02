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

ActiveRecord::Schema.define(version: 20170601145200) do

  create_table "growers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                  null: false
    t.string   "title",                                 null: false
    t.string   "address"
    t.string   "phone"
    t.string   "url"
    t.string   "about"
    t.text     "description", limit: 65535
    t.string   "logo"
    t.integer  "status",      limit: 1,     default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "plant_id"
    t.integer  "kind",       limit: 1,     default: 1, null: false
    t.string   "title",                                null: false
    t.text     "content",    limit: 65535
    t.string   "photo"
    t.date     "taken_at"
    t.integer  "position"
    t.integer  "status",     limit: 1,     default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["plant_id"], name: "index_pictures_on_plant_id", using: :btree
  end

  create_table "plants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "grower_id"
    t.string   "title_la",                                null: false
    t.string   "title",                                   null: false
    t.string   "hybrid_parentage"
    t.integer  "kind",             limit: 1, default: 0,  null: false
    t.integer  "zone_min",                   default: 1,  null: false
    t.integer  "zone_max",                   default: 11, null: false
    t.integer  "quantity",                   default: 1,  null: false
    t.integer  "planted_in"
    t.integer  "position"
    t.integer  "status",           limit: 1, default: 0,  null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["grower_id"], name: "index_plants_on_grower_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "role",            limit: 1, default: 0, null: false
    t.string   "last_name",                             null: false
    t.string   "first_name",                            null: false
    t.string   "email",                                 null: false
    t.string   "password_digest",                       null: false
    t.string   "remember_digest"
    t.integer  "status",          limit: 1, default: 0, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "pictures", "plants"
  add_foreign_key "plants", "growers"
end
