class CreateSpellAffects < ActiveRecord::Migration
  def self.up
    create_table :spell_affects do |t|
      t.integer :equipment_piece_id
      t.integer :spell_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :spell_affects
  end
end
