class RemoveTraitFromQuestion < ActiveRecord::Migration
  def self.up
    remove_column :questions, :trait
  end

  def self.down
    add_column :questions, :trait, :string
  end
end
