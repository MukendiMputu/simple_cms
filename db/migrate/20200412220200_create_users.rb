class CreateUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :users do |t|
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      t.string "nickname", :limit => 25, :unique => true
      t.string "email", :default => '', :null => false
      t.string "password_digest"
      t.string "picture"

      t.timestamps
    end
  end

  def down
    drop_table :users 
  end
end
