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

ActiveRecord::Schema[8.0].define(version: 2026_02_13_094047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "client_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company_name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_client_profiles_on_user_id"
  end

  create_table "freelancer_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.text "skills"
    t.decimal "fixed_price"
    t.string "portfolio_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_freelancer_profiles_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "budget"
    t.string "project_type"
    t.string "experience_level"
    t.date "deadline"
    t.bigint "user_id", null: false
    t.string "skills", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "company_name"
    t.text "bio"
    t.string "size"
    t.string "phone"
    t.string "vat_id"
    t.string "timezone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "fixed_price"
    t.string "portfolio_url"
    t.text "education"
    t.text "experience"
    t.string "experience_title"
    t.string "experience_company"
    t.string "experience_duration"
    t.text "experience_description"
    t.string "degree"
    t.string "complete_year"
    t.string "university"
    t.string "skills", default: [], array: true
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "freelancer_id", null: false
    t.text "cover_letter"
    t.integer "bid_amount"
    t.string "estimated_time"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelancer_id"], name: "index_proposals_on_freelancer_id"
    t.index ["job_id"], name: "index_proposals_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_profiles", "users"
  add_foreign_key "freelancer_profiles", "users"
  add_foreign_key "jobs", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "proposals", "jobs"
  add_foreign_key "proposals", "users", column: "freelancer_id"
end
