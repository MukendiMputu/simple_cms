# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_21_022821) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "agenda", limit: 45
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "guests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email"
    t.integer "booking_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_guests_on_booking_id"
  end

  create_table "invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "booking_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id", "guest_id"], name: "index_invitations_on_booking_id_and_guest_id"
  end

  create_table "notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "booking_id"
    t.text "content"
    t.integer "prev_note"
    t.integer "next_note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_notes_on_booking_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "building", limit: 45
    t.string "name", limit: 25
    t.string "number", limit: 15
    t.integer "capacity", limit: 3
    t.string "configuration", limit: 50
    t.string "picture"
    t.text "avantgarde"
    t.datetime "created_at", precision: 6, default: -> { "current_timestamp(6)" }, null: false
    t.datetime "updated_at", precision: 6, default: -> { "current_timestamp(6)" }, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "nickname"
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
