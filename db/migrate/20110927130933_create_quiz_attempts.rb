class CreateQuizAttempts < ActiveRecord::Migration
  def self.up
    create_table :quiz_attempts do |t|
      t.integer :quiz_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quiz_attempts
  end
end
