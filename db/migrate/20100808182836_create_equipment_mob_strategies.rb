class CreateEquipmentMobStrategies < ActiveRecord::Migration
  def self.up
    create_table :equipment_mob_strategies do |t|
      t.integer :equipment_monster_id
      t.integer :greater_tank_prot_id
      t.integer :lesser_tank_prot1_id
      t.integer :lesser_tank_prot2_id
      t.integer :greater_party_prot_id
      t.integer :lesser_party_prot1_id
      t.integer :lesser_party_prot2_id
      t.text :additional_prot_info
      t.text :walkthrough
      t.integer :map_id
      t.integer :mapx
      t.integer :mapy
      t.boolean :quest_mob

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_mob_strategies
  end
end
