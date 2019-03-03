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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", id: :text, force: :cascade do |t|
    t.text "password", null: false
    t.text "email"
    t.text "name", null: false
  end

  create_table "contact", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "email", null: false
    t.text "subject"
    t.text "message", null: false
  end

  create_table "devlanguage", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "level", null: false
    t.text "description"
  end

  create_table "email", primary_key: "email", id: :text, force: :cascade do |t|
  end

  create_table "persionalinfo", id: :serial, force: :cascade do |t|
    t.text "major", null: false
    t.integer "specializedid", null: false
    t.text "email", null: false
    t.text "phone", null: false
    t.text "about"
  end

  create_table "project", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "link", null: false
    t.text "description"
  end

  create_table "qualification", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.date "date", null: false
    t.text "result"
    t.date "expire"
  end

  create_table "skill", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "level", null: false
  end

  create_table "specialized", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
  end

  add_foreign_key "persionalinfo", "specialized", column: "specializedid", name: "persionalinfo_specialized_fk", on_update: :cascade
end
