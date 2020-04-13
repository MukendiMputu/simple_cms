class CreateBookings < ActiveRecord::Migration[6.0]
  def up
    create_table :bookings do |t|
      t.string "agenda", :limit => 45
      t.date "date"
      t.time "start_time"
      t.time "end_time"
      t.integer "user_id"
      t.integer "room_id"

      t.timestamps
    end
    add_index("bookings", "user_id")
    add_index("bookings", "room_id")
  end

  def down
    drop_table :bookings
  end
end
