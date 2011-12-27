class CreateQuestionsTraits < ActiveRecord::Migration
  def self.up
    create_table :questions_traits, {:id => false} do |t|
      t.integer :question_id
      t.integer :trait_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions_traits
  end
end
