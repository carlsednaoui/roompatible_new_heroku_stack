class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :user_id
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
