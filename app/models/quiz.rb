class Quiz < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :quiz_attempts
end
