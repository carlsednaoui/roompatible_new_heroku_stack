class Room < ActiveRecord::Base
    validates_presence_of :title, :price, :address, :description
    belongs_to :user
    has_one :location

    has_many :assets
    accepts_nested_attributes_for :assets, :allow_destroy => true
end
