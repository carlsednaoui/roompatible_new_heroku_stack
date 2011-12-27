class AddLastReadTimestampToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :last_read_timestamp, :datetime
  end

  def self.down
    remove_column :messages, :last_read_timestamp
  end
end
