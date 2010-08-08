class RemoveMapIdFromEquipmentMobStrategy < ActiveRecord::Migration
  def self.up
    remove_column :equipment_mob_strategies, :map_id
    remove_column :equipment_mob_strategies, :mapx
    remove_column :equipment_mob_strategies, :mapy
  end

  def self.down
    add_column :equipment_mob_strategies, :map_id, :integer
    add_column :equipment_mob_strategies, :mapx, :integer
    add_column :equipment_mob_strategies, :mapy, :integer
  end
end
