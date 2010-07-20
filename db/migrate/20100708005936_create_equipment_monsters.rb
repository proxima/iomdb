class CreateEquipmentMonsters < ActiveRecord::Migration
  def self.up
    create_table :equipment_monsters do |t|
      t.string :name
      t.text :walkthrough

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_monsters
  end
end
