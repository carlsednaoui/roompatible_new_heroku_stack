class AddRenttimeToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :price_per_week_month, :string
  end

  def self.down
    remove_column :rooms, :price_per_week_month
  end
end
