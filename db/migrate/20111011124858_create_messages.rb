class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
        t.text :body
        t.integer :from_user_id
        t.integer :to_user_id
        t.integer :conversation_id

        t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
