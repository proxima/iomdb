class CreateWeaponDamageAffects < ActiveRecord::Migration
  def self.up
    create_table :weapon_damage_affects do |t|
      t.integer :equipment_piece_id
      t.integer :weapon_damage_level_id

      t.timestamps
    end
  end

  def self.down
    drop_table :weapon_damage_affects
  end
end
