class CreateResistanceAffects < ActiveRecord::Migration
  def self.up
    create_table :resistance_affects do |t|
      t.integer :equipment_piece_id
      t.integer :damage_type_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :resistance_affects
  end
end
