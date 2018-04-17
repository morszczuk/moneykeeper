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

ActiveRecord::Schema.define(version: 20180404061804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_incomes", force: :cascade do |t|
    t.decimal "amount"
    t.integer "carrier"
    t.text "description"
    t.bigint "budget_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_plan_id"], name: "index_budget_incomes_on_budget_plan_id"
  end

  create_table "budget_plans", force: :cascade do |t|
    t.date "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_spendings", force: :cascade do |t|
    t.bigint "category_id"
    t.decimal "amount"
    t.bigint "budget_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_plan_id"], name: "index_budget_spendings_on_budget_plan_id"
    t.index ["category_id"], name: "index_budget_spendings_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "label_filters", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.datetime "exec_date"
    t.datetime "order_date"
    t.string "operation_type"
    t.string "description"
    t.decimal "amount"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["description"], name: "index_operations_on_description"
  end

  create_table "payment_parts", force: :cascade do |t|
    t.decimal "amount"
    t.bigint "category_id"
    t.bigint "operation_id"
    t.text "labels", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_spending_id"
    t.index ["budget_spending_id"], name: "index_payment_parts_on_budget_spending_id"
    t.index ["category_id"], name: "index_payment_parts_on_category_id"
    t.index ["operation_id"], name: "index_payment_parts_on_operation_id"
  end

  add_foreign_key "budget_incomes", "budget_plans"
  add_foreign_key "budget_spendings", "budget_plans"
  add_foreign_key "budget_spendings", "categories"
  add_foreign_key "payment_parts", "budget_spendings"
  add_foreign_key "payment_parts", "categories"
  add_foreign_key "payment_parts", "operations"
end
