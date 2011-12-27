class AddManyFieldsToRoommate < ActiveRecord::Migration
  def self.up
    add_column :roommates, :gender, :string
    add_column :roommates, :desired_gender, :string
    add_column :roommates, :max_renters, :integer
    add_column :roommates, :age, :integer
    add_column :roommates, :sexual_orientation, :string
    add_column :roommates, :has_pets, :boolean
    add_column :roommates, :willing_to_live_with_pets, :boolean
    add_column :roommates, :willing_to_live_with_smoker, :boolean
    add_column :roommates, :does_smoke, :boolean
    add_column :roommates, :desired_living_area, :string
  end

  def self.down
    remove_column :roommates, :desired_living_area
    remove_column :roommates, :does_smoke
    remove_column :roommates, :willing_to_live_with_smoker
    remove_column :roommates, :willing_to_live_with_pets
    remove_column :roommates, :has_pets
    remove_column :roommates, :sexual_orientation
    remove_column :roommates, :age
    remove_column :roommates, :max_renters
    remove_column :roommates, :desired_gender
    remove_column :roommates, :gender
  end
end
