class Location < ActiveRecord::Base
    belongs_to :room

    attr_accessible :address, :latitude, :longitude
    geocoded_by :address
    after_validation :geocode, :if => :address_changed?
    acts_as_gmappable

    reverse_geocoded_by :latitude, :longitude do |obj,results|
        if geo = results.first
            obj.city    = geo.city
        end
    end
    after_validation :reverse_geocode

    def gmaps4rails_address
        address
    end

    def self.new_location(location_address, location_room_id)
        create_new_location = Location.new
        create_new_location.address = location_address
        create_new_location.room_id = location_room_id
        begin
            create_new_location.save!
        rescue
        end
    end
end
