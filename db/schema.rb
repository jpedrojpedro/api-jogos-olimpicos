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

ActiveRecord::Schema.define(version: 20170924142920) do

  create_table "batteries", force: :cascade do |t|
    t.integer  "number",                   null: false
    t.integer  "max_tries",    default: 1, null: false
    t.integer  "max_athletes", default: 8, null: false
    t.integer  "stage_id",                 null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["number", "stage_id"], name: "idx_unq_number_on_battery", unique: true
    t.index ["stage_id"], name: "index_batteries_on_stage_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.string   "slug",       limit: 100, null: false
    t.string   "place",      limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["slug"], name: "idx_unq_slug_on_competition", unique: true
  end

  create_table "modalities", force: :cascade do |t|
    t.string   "name",              limit: 100, null: false
    t.string   "slug",              limit: 100, null: false
    t.string   "measurement_unity", limit: 20,  null: false
    t.datetime "ended_at"
    t.integer  "competition_id",                null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["competition_id"], name: "index_modalities_on_competition_id"
    t.index ["slug"], name: "idx_unq_slug_on_modality", unique: true
  end

  create_table "results", force: :cascade do |t|
    t.string   "athlete",    limit: 100,                         null: false
    t.string   "country",    limit: 3,                           null: false
    t.decimal  "value",                  precision: 6, scale: 3, null: false
    t.integer  "battery_id",                                     null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["battery_id"], name: "index_results_on_battery_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string   "name",              limit: 50, null: false
    t.string   "slug",              limit: 50, null: false
    t.integer  "allowed_batteries",            null: false
    t.integer  "modality_id",                  null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["modality_id"], name: "index_stages_on_modality_id"
    t.index ["name", "modality_id"], name: "idx_unq_name_modality_on_step", unique: true
    t.index ["slug", "modality_id"], name: "idx_unq_slug_on_stage", unique: true
  end

end
