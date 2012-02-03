class Room < ActiveRecord::Base
    before_validation :create_location, :on=>:create
    before_validation :update_location, :on=>:update
    validates_presence_of :title, :price, :address, :description, :location
    validates_associated :location
    belongs_to :user
    has_one :location

    has_many :assets
    accepts_nested_attributes_for :assets, :allow_destroy => true


    def create_location
       self.build_location :address=>address
    end

    def update_location
       self.build_location :address=>address
    end
end
