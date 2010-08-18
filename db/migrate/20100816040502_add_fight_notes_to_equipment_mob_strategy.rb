class AddFightNotesToEquipmentMobStrategy < ActiveRecord::Migration
  def self.up
    add_column :equipment_mob_strategies, :fight_notes, :text
  end

  def self.down
    remove_column :equipment_mob_strategies, :fight_notes
  end
end
