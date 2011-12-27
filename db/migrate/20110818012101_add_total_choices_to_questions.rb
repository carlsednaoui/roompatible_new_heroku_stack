class AddTotalChoicesToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :total_choices, :integer
  end

  def self.down
    remove_column :questions, :total_choices
  end
end
