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

ActiveRecord::Schema.define(version: 20150318215414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "for_sales", id: :serial, force: :cascade do |t|
    t.float "volume"
    t.string "source"
    t.text "description"
    t.integer "price"
    t.string "contact_info"
    t.integer "listing_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["listing_area_id"], name: "index_for_sales_on_listing_area_id"
  end

  create_table "listing_areas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "policy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "kml_file_name"
    t.string "kml_content_type"
    t.integer "kml_file_size"
    t.datetime "kml_updated_at"
    t.json "polygon"
  end

  create_table "place_of_use_area_water_rights", id: :serial, force: :cascade do |t|
    t.integer "place_of_use_area_id"
    t.integer "water_right_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["place_of_use_area_id"], name: "index_place_of_use_area_water_rights_on_place_of_use_area_id"
    t.index ["water_right_id"], name: "index_place_of_use_area_water_rights_on_water_right_id"
  end

  create_table "place_of_use_areas", id: :serial, force: :cascade do |t|
    t.string "name"
    t.json "polygon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "kml_file_name"
    t.string "kml_content_type"
    t.integer "kml_file_size"
    t.datetime "kml_updated_at"
    t.string "color"
  end

  create_table "point_of_diversion_water_rights", id: :serial, force: :cascade do |t|
    t.integer "point_of_diversion_id"
    t.integer "water_right_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["point_of_diversion_id"], name: "index_point_of_diversion_water_rights_on_point_of_diversion_id"
    t.index ["water_right_id"], name: "index_point_of_diversion_water_rights_on_water_right_id"
  end

  create_table "point_of_diversions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.json "point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "kml_file_name"
    t.string "kml_content_type"
    t.integer "kml_file_size"
    t.datetime "kml_updated_at"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
  end

  create_table "wanteds", id: :serial, force: :cascade do |t|
    t.float "volume"
    t.string "source"
    t.text "description"
    t.string "contact_info"
    t.integer "listing_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["listing_area_id"], name: "index_wanteds_on_listing_area_id"
  end

  create_table "water_rights", id: :serial, force: :cascade do |t|
    t.string "number"
    t.decimal "flow_cfs"
    t.decimal "flow_ac_ft"
    t.string "uses"
    t.string "change_application_number"
    t.date "proof_due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.date "priority_date"
    t.text "comments"
    t.string "external_link"
    t.string "view_link_text"
    t.index ["user_id"], name: "index_water_rights_on_user_id"
  end

end
