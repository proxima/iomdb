class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :stamina
      t.integer :charisma
      t.integer :hpregen
      t.integer :spregen
      t.integer :epregen
      t.integer :skill_max
      t.integer :spell_max
      t.decimal :skill_rate
      t.decimal :spell_rate
      t.decimal :experience_rate
      t.boolean :need_dark_to_regen
      t.boolean :need_light_to_regen
      t.boolean :corpse_eating

      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
