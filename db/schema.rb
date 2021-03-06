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

ActiveRecord::Schema.define(version: 20160107215915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "cohort_id"
    t.integer  "student_id"
    t.integer  "present"
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["student_id"], name: "index_attendances_on_student_id", using: :btree

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "archived"
  end

  create_table "homeworks", force: :cascade do |t|
    t.string   "hw_submission"
    t.string   "skill"
    t.string   "student_self_assessment"
    t.integer  "student_id"
    t.integer  "students_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "name"
  end

  add_index "homeworks", ["students_id"], name: "index_homeworks_on_students_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "project_submission"
    t.string   "link"
    t.string   "teacher_assessment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "projects_students", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "project_id"
  end

  add_index "projects_students", ["project_id"], name: "index_projects_students_on_project_id", using: :btree
  add_index "projects_students", ["student_id"], name: "index_projects_students_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "github_username"
    t.integer  "cohort_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.integer  "cohort_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "cohort_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "teachers", ["cohort_id"], name: "index_teachers_on_cohort_id", using: :btree
  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree

end
