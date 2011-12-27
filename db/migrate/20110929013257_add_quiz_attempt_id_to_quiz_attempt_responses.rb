class AddQuizAttemptIdToQuizAttemptResponses < ActiveRecord::Migration
  def self.up
    add_column :quiz_attempt_responses, :quiz_attempt_id, :integer
  end

  def self.down
    remove_column :quiz_attempt_responses, :quiz_attempt_id
  end
end
