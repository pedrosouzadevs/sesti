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

ActiveRecord::Schema[7.0].define(version: 2024_02_28_191753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "armors", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "axes", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id", null: false
    t.index ["weapon_id"], name: "index_axes_on_weapon_id"
  end

  create_table "boots", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id", null: false
    t.index ["weapon_id"], name: "index_clubs_on_weapon_id"
  end

  create_table "creatures", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distances", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id", null: false
    t.index ["weapon_id"], name: "index_distances_on_weapon_id"
  end

  create_table "equips", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "weapon_id", null: false
    t.bigint "helmet_id", null: false
    t.bigint "leg_id", null: false
    t.bigint "ring_id", null: false
    t.bigint "necklace_id", null: false
    t.bigint "boot_id", null: false
    t.bigint "trinket_id", null: false
    t.bigint "quiver_id", null: false
    t.bigint "armor_id", null: false
    t.index ["armor_id"], name: "index_equips_on_armor_id"
    t.index ["boot_id"], name: "index_equips_on_boot_id"
    t.index ["helmet_id"], name: "index_equips_on_helmet_id"
    t.index ["leg_id"], name: "index_equips_on_leg_id"
    t.index ["necklace_id"], name: "index_equips_on_necklace_id"
    t.index ["quiver_id"], name: "index_equips_on_quiver_id"
    t.index ["ring_id"], name: "index_equips_on_ring_id"
    t.index ["trinket_id"], name: "index_equips_on_trinket_id"
    t.index ["user_id"], name: "index_equips_on_user_id"
    t.index ["weapon_id"], name: "index_equips_on_weapon_id"
  end

  create_table "helmets", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legs", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "necklaces", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quivers", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rings", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rods", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id", null: false
    t.index ["weapon_id"], name: "index_rods_on_weapon_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "equip_id", null: false
    t.index ["equip_id"], name: "index_sessions_on_equip_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "swords", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id", null: false
    t.index ["weapon_id"], name: "index_swords_on_weapon_id"
  end

  create_table "trinkets", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wands", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weapon_id", null: false
    t.index ["weapon_id"], name: "index_wands_on_weapon_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "path"
    t.integer "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "axes", "weapons"
  add_foreign_key "clubs", "weapons"
  add_foreign_key "distances", "weapons"
  add_foreign_key "equips", "armors"
  add_foreign_key "equips", "boots"
  add_foreign_key "equips", "helmets"
  add_foreign_key "equips", "legs"
  add_foreign_key "equips", "necklaces"
  add_foreign_key "equips", "quivers"
  add_foreign_key "equips", "rings"
  add_foreign_key "equips", "trinkets"
  add_foreign_key "equips", "users"
  add_foreign_key "equips", "weapons"
  add_foreign_key "rods", "weapons"
  add_foreign_key "sessions", "equips"
  add_foreign_key "sessions", "users"
  add_foreign_key "swords", "weapons"
  add_foreign_key "wands", "weapons"
end
