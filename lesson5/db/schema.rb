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

ActiveRecord::Schema.define(version: 2021_12_15_132513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "physician_id"
    t.bigint "patient_id"
    t.datetime "appointment_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["physician_id"], name: "index_appointments_on_physician_id"
  end

  create_table "diagnosis_items", force: :cascade do |t|
    t.string "content", default: "Diagnosis", null: false
    t.bigint "physician_id"
    t.bigint "patient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_diagnosis_items_on_patient_id"
    t.index ["physician_id"], name: "index_diagnosis_items_on_physician_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", default: "Your name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name", default: "Your last name", null: false
    t.integer "age", default: 1, null: false
    t.string "email", default: "Your email", null: false
  end

  create_table "physicians", force: :cascade do |t|
    t.string "first_name", default: "Your name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name", default: "Your last name", null: false
    t.string "phone", default: "Your phone", null: false
    t.string "level", default: "Your level", null: false
  end

end
