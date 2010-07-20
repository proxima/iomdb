class CreateHungerLevels < ActiveRecord::Migration
  def self.up
    create_table :hunger_levels do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :hunger_levels
  end
end
