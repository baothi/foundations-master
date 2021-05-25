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

ActiveRecord::Schema.define(version: 20160329031412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "activities", force: :cascade do |t|
    t.string   "type"
    t.integer  "performer_id"
    t.hstore   "details"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "client_documents", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "stage_id"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "client_images", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "stage_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "image_category_id"
    t.string   "caption"
    t.string   "file"
  end

  add_index "client_images", ["client_id"], name: "index_client_images_on_client_id", using: :btree
  add_index "client_images", ["stage_id"], name: "index_client_images_on_stage_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.integer  "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "sitemap_image"
  end

  create_table "community_amenities", force: :cascade do |t|
    t.integer  "community_id"
    t.integer  "amenity_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "elevations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "file"
    t.integer  "client_id"
  end

  add_index "elevations", ["client_id"], name: "index_elevations_on_client_id", using: :btree

  create_table "floor_plans", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.string   "file"
  end

  add_index "floor_plans", ["client_id"], name: "index_floor_plans_on_client_id", using: :btree

  create_table "image_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_id"
    t.boolean  "featured"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "file"
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "model_categories", force: :cascade do |t|
    t.integer  "model_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "model_categories", ["category_id"], name: "index_model_categories_on_category_id", using: :btree
  add_index "model_categories", ["model_id"], name: "index_model_categories_on_model_id", using: :btree

  create_table "model_stages", force: :cascade do |t|
    t.integer  "model_id"
    t.integer  "stage_id"
    t.string   "stage_image_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "stage_image"
  end

  add_index "model_stages", ["model_id"], name: "index_model_stages_on_model_id", using: :btree
  add_index "model_stages", ["stage_id"], name: "index_model_stages_on_stage_id", using: :btree

  create_table "models", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.string   "square_footage"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "selections", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.integer  "client_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "selections", ["category_id"], name: "index_selections_on_category_id", using: :btree
  add_index "selections", ["client_id"], name: "index_selections_on_client_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "upgrades", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.integer  "client_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "upgrades", ["client_id"], name: "index_upgrades_on_client_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "mobile"
    t.integer  "model_id"
    t.string   "type"
    t.string   "lot"
    t.integer  "stage_id"
    t.integer  "community_id"
    t.datetime "closing_date"
    t.string   "account_number"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["community_id"], name: "index_users_on_community_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["model_id"], name: "index_users_on_model_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["stage_id"], name: "index_users_on_stage_id", using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "model_categories", "categories"
  add_foreign_key "model_categories", "models"
  add_foreign_key "model_stages", "models"
  add_foreign_key "model_stages", "stages"
  add_foreign_key "users", "communities"
  add_foreign_key "users", "models"
  add_foreign_key "users", "stages"
end
