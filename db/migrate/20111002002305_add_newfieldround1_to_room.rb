class AddNewfieldround1ToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :desired_length_of_stay_number, :integer
    add_column :rooms, :desired_gender, :string
    add_column :rooms, :couples_allowed, :boolean
    add_column :rooms, :smoking_on_premise, :boolean
    add_column :rooms, :pets_on_premise, :boolean
    add_column :rooms, :amenities_ac, :boolean
    add_column :rooms, :amenities_heater, :boolean
    add_column :rooms, :amenities_cable_tv, :boolean
    add_column :rooms, :amenities_internet, :boolean
    add_column :rooms, :amenities_kitchen, :boolean
    add_column :rooms, :amenities_washer, :boolean
    add_column :rooms, :amenities_backyard, :boolean
    add_column :rooms, :amenities_balcony, :boolean
    add_column :rooms, :amenities_rooftop, :boolean
    add_column :rooms, :amenities_elevator, :boolean
    add_column :rooms, :smoking_allowed, :boolean
    add_column :rooms, :pets_allowed, :boolean
  end

  def self.down
    remove_column :rooms, :pets_allowed
    remove_column :rooms, :smoking_allowed
    remove_column :rooms, :amenities_elevator
    remove_column :rooms, :amenities_rooftop
    remove_column :rooms, :amenities_balcony
    remove_column :rooms, :amenities_backyard
    remove_column :rooms, :amenities_washer
    remove_column :rooms, :amenities_kitchen
    remove_column :rooms, :amenities_internet
    remove_column :rooms, :amenities_cable_tv
    remove_column :rooms, :amenities_heater
    remove_column :rooms, :amenities_ac
    remove_column :rooms, :pets_on_premise
    remove_column :rooms, :smoking_on_premise
    remove_column :rooms, :couples_allowed
    remove_column :rooms, :desired_gender
    remove_column :rooms, :desired_length_of_stay_number
  end
end
