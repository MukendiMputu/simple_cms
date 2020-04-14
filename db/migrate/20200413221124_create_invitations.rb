class CreateInvitations < ActiveRecord::Migration[6.0]
  def up
    create_table :invitations do |t|
      t.integer "guest_id"
      t.integer "booking_id"
      t.string "status"
      
      t.timestamps
    end
    add_index("invitations", ["booking_id", "guest_id"])
  end

  def down
    drop_table :invitations
  end
end
