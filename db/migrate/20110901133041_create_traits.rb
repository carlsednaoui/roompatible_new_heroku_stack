class CreateTraits < ActiveRecord::Migration
  def self.up
    create_table :traits do |t|
      t.string :name
      t.float :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :traits
  end
end
