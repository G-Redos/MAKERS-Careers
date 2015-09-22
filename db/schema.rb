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

ActiveRecord::Schema.define(version: 20150922104941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider",                         null: false
    t.string   "uid",                              null: false
    t.string   "auth_token",                       null: false
    t.string   "image_url"
    t.string   "github_username",                  null: false
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["uid", "provider"], name: "index_admins_on_uid_and_provider", using: :btree
  add_index "admins", ["uid"], name: "index_admins_on_uid", unique: true, using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id", using: :btree
  add_index "job_applications", ["student_id"], name: "index_job_applications_on_student_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status",          default: 0
    t.string   "company"
    t.integer  "roles_available"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "jobs", ["status"], name: "index_jobs_on_status", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",                         null: false
    t.string   "uid",                              null: false
    t.string   "auth_token",                       null: false
    t.string   "image_url"
    t.string   "github_username",                  null: false
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["uid", "provider"], name: "index_students_on_uid_and_provider", using: :btree
  add_index "students", ["uid"], name: "index_students_on_uid", unique: true, using: :btree

  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "students"
end
