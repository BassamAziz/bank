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

ActiveRecord::Schema.define(version: 2020_02_17_091431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "status"
    t.integer "balance_cents", default: 0, null: false
    t.string "balance_currency", default: "USD", null: false
    t.string "account_number"
    t.bigint "client_id"
    t.index ["account_number"], name: "index_accounts_on_account_number"
    t.index ["client_id"], name: "index_accounts_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "client_number"
    t.index ["client_number"], name: "index_clients_on_client_number"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "from_id"
    t.bigint "to_id"
    t.string "status"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.string "transaction_number"
    t.index ["from_id"], name: "index_transactions_on_from_id"
    t.index ["to_id"], name: "index_transactions_on_to_id"
    t.index ["transaction_number"], name: "index_transactions_on_transaction_number"
  end

  add_foreign_key "transactions", "accounts", column: "from_id"
  add_foreign_key "transactions", "accounts", column: "to_id"
end
