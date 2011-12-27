class AddUserIdToRoommate < ActiveRecord::Migration
  def self.up
    add_column :roommates, :user_id, :integer
  end

  def self.down
    remove_column :roommates, :user_id
  end
end
