class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :quiz_id
      t.string :prompt
      t.string :choice_1
      t.string :choice_2
      t.string :choice_3
      t.string :choice_4
      t.string :choice_5

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
