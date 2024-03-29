class CreateRoommates < ActiveRecord::Migration
  def self.up
    create_table :roommates do |t|
      t.string :name
      t.text :about
      t.integer :rent

      t.timestamps
    end
  end

  def self.down
    drop_table :roommates
  end
end
