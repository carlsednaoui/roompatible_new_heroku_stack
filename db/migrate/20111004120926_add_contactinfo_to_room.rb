class AddContactinfoToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :contact_info, :string
  end

  def self.down
    remove_column :rooms, :contact_info
  end
end
