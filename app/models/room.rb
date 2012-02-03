class Room < ActiveRecord::Base
    before_validation :create_location, :on=>:create
    validates_presence_of :title, :price, :address, :description, :location
    validates_associated :location
    belongs_to :user
    has_one :location

    has_many :assets
    accepts_nested_attributes_for :assets, :allow_destroy => true


    def create_location
       self.build_location :address=>address
    end
end
