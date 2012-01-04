class AddRoommateActiveToRoommate < ActiveRecord::Migration
  def change
    add_column :roommates, :roommate_active, :boolean, :default => true
  end
end
