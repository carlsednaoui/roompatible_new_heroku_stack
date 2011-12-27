class AddStaytimeToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :desired_length_of_stay_week_month, :string
  end

  def self.down
    remove_column :rooms, :desired_length_of_stay_week_month
  end
end
