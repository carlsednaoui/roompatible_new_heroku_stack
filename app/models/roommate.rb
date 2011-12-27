class Roommate < ActiveRecord::Base
    validates_presence_of :name, :about, :rent
    belongs_to :user
end
