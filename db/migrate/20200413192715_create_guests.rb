class CreateGuests < ActiveRecord::Migration[6.0]
  def up
    create_table :guests do |t|
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "email"
      t.integer "booking_id"
      
      t.timestamps
    end
    add_index("guests", "booking_id")
  end

  def down
    drop_table :guests
  end
end
