class CreateWeaponDamageLevels < ActiveRecord::Migration
  def self.up
    create_table :weapon_damage_levels do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :weapon_damage_levels
  end
end
