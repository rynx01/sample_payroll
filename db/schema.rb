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

ActiveRecord::Schema.define(version: 20170518033757) do

  create_table "allowances", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount",      precision: 9, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id", "created_at"], name: "index_allowances_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_allowances_on_user_id"
  end

  create_table "dope_adjustments", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "created_at"], name: "index_dope_adjustments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_dope_adjustments_on_user_id"
  end

  create_table "nope_adjustments", force: :cascade do |t|
    t.string   "description"
    t.decimal  "amount"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id", "created_at"], name: "index_nope_adjustments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_nope_adjustments_on_user_id"
  end

  create_table "payrolls", force: :cascade do |t|
    t.string   "period"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_payrolls_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_payrolls_on_user_id"
  end

  create_table "reimbursements", force: :cascade do |t|
    t.string   "category"
    t.string   "description"
    t.decimal  "amount",      precision: 9, scale: 2
    t.decimal  "price",       precision: 9, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id", "created_at"], name: "index_reimbursements_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reimbursements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "password_digest"
    t.boolean  "admin",            default: false
    t.string   "name"
    t.integer  "birthday"
    t.string   "contact_no"
    t.string   "account_no"
    t.string   "bank"
    t.integer  "base_salary"
    t.integer  "no_of_dependents"
    t.string   "status"
  end

end
