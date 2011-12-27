class RemoveUserIdAndQuizIdFromQuizAttemptResponse < ActiveRecord::Migration
  def self.up
    remove_column :quiz_attempt_responses, :user_id
    remove_column :quiz_attempt_responses, :quiz_id
  end

  def self.down
    add_column :quiz_attempt_responses, :user_id, :integer
    add_column :quiz_attempt_responses, :quiz_id, :integer
  end
end
