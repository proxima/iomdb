class RemoveWalkthroughFromEquipmentMonster < ActiveRecord::Migration
  def self.up
    remove_column :equipment_monsters, :walkthrough
  end

  def self.down
    add_column :equipment_monsters, :walkthrough, :text
  end
end
