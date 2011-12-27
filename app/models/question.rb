class Question < ActiveRecord::Base
    belongs_to :quiz
    has_many :results
    has_and_belongs_to_many :traits
end
