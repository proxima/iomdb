class AddDamageTypeIdToWeaponDamageAffect < ActiveRecord::Migration
  def self.up
    add_column :weapon_damage_affects, :damage_type_id, :integer
  end

  def self.down
    remove_column :weapon_damage_affects, :damage_type_id
  end
end
