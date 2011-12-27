class AddingTraitToQuestion < ActiveRecord::Migration
    def self.up
        add_column :questions, :trait, :string
    end

    def self.down
        remove_column :questions, :trait
    end
end
