class CreateArmorClassLevels < ActiveRecord::Migration
  def self.up
    create_table :armor_class_levels do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :armor_class_levels
  end
end
