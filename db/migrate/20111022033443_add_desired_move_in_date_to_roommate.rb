class AddDesiredMoveInDateToRoommate < ActiveRecord::Migration
  def self.up
    add_column :roommates, :desired_move_in_date, :date
  end

  def self.down
    remove_column :roommates, :desired_move_in_date
  end
end
