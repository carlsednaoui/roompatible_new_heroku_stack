class AddStaytimedetailsToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :desired_length_of_stay_more_less, :string
  end

  def self.down
    remove_column :rooms, :desired_length_of_stay_more_less
  end
end
