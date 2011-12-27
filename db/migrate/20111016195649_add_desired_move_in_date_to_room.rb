class AddDesiredMoveInDateToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :desired_move_in_date, :date
  end

  def self.down
    remove_column :rooms, :desired_move_in_date
  end
end
