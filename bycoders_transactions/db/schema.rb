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

ActiveRecord::Schema.define(version: 2020_11_14_002717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "number"
    t.bigint "holder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holder_id"], name: "index_cards_on_holder_id"
  end

  create_table "financial_operation_types", force: :cascade do |t|
    t.string "description"
    t.integer "nature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_operations", force: :cascade do |t|
    t.datetime "ocurred_in"
    t.decimal "amount", precision: 8, scale: 2
    t.bigint "store_id"
    t.bigint "holder_id"
    t.bigint "financial_operation_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_operation_type_id"], name: "index_financial_operations_on_financial_operation_type_id"
    t.index ["holder_id"], name: "index_financial_operations_on_holder_id"
    t.index ["store_id"], name: "index_financial_operations_on_store_id"
  end

  create_table "holders", force: :cascade do |t|
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_holders_on_cpf", unique: true
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "holders"
  add_foreign_key "financial_operations", "financial_operation_types"
  add_foreign_key "financial_operations", "holders"
  add_foreign_key "financial_operations", "stores"
end
