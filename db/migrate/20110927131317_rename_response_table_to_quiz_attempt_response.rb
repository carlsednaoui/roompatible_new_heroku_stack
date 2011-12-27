class RenameResponseTableToQuizAttemptResponse < ActiveRecord::Migration
  def self.up
    rename_table :responses, :quiz_attempt_responses
  end

  def self.down
    rename_table :quiz_attempt_responses, :responses
  end
end
