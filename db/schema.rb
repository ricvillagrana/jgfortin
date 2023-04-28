# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_28_225226) do
  create_table "homeowner_insurances", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "address", null: false
    t.string "zip", null: false
    t.string "city", null: false
    t.string "province", null: false
    t.integer "assessment", null: false
    t.float "brokerage_fees"
    t.integer "language", null: false
    t.string "homeowner_name_1", null: false
    t.string "homeowner_name_2"
    t.string "homeowner_name_3"
    t.integer "type_of_property", null: false
    t.boolean "existing_homeowner"
    t.date "purchase_date", null: false
    t.integer "lot_numbers", null: false
    t.string "property_address", null: false
    t.string "property_city", null: false
    t.string "property_zip", null: false
    t.boolean "bound_by_water", null: false
    t.boolean "on_municipal_water", null: false
    t.boolean "title_insurance_already_issued", null: false
    t.boolean "denied_for_insurance", null: false
    t.text "notes"
    t.string "referral_agent_name"
    t.string "referral_agent_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
