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

ActiveRecord::Schema.define(version: 20170111215143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "report_id"
    t.string   "vendor",     null: false
    t.date     "date",       null: false
    t.integer  "amount",     null: false
    t.boolean  "is_paid",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_expenses_on_person_id", using: :btree
    t.index ["report_id"], name: "index_expenses_on_report_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "report_id"
    t.integer  "amount_owed",       null: false
    t.boolean  "has_paid",          null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "owed_to_person_id"
    t.index ["person_id"], name: "index_payments_on_person_id", using: :btree
    t.index ["report_id"], name: "index_payments_on_report_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
    t.string   "uuid"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_people", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_report_people_on_person_id", using: :btree
    t.index ["report_id"], name: "index_report_people_on_report_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.string   "uuid"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "reconciled"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "person_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["person_id"], name: "index_users_on_person_id", using: :btree
  end

  add_foreign_key "expenses", "people"
  add_foreign_key "expenses", "reports"
  add_foreign_key "payments", "people"
  add_foreign_key "payments", "reports"
  add_foreign_key "report_people", "people"
  add_foreign_key "report_people", "reports"
  add_foreign_key "users", "people"
end
