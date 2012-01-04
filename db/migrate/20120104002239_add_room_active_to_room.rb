class AddRoomActiveToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :room_active, :boolean, :default => true
  end
end
