class QuizAttemptResponse < ActiveRecord::Base
    belongs_to :quiz_attempt
    belongs_to :question
end
