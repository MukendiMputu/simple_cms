class CreateRooms < ActiveRecord::Migration[6.0]
  def up
    create_table :rooms do |t|
      t.string "building", :limit => 45
      t.string "number", :limit => 15
      t.integer "capacity", :limit => 3
      t.string "configuration", :limit => 50
      t.string "picture"
      t.text "Avantgarde", :null => false

      t.timestamps
    end
  end

  def down
    drop_table :rooms
  end
end
