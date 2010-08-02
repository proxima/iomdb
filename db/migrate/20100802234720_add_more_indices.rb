class AddMoreIndices < ActiveRecord::Migration
  def self.up
    add_index :skill_affects, [:id, :equipment_piece_id]
    add_index :spell_affects, [:id, :equipment_piece_id]
    add_index :stat_affects, [:id, :equipment_piece_id]
    add_index :slot_affects, [:id, :equipment_piece_id]
    add_index :resistance_affects, [:id, :equipment_piece_id]
  end

  def self.down
    remove_index :skill_affects, [:id, :equipment_piece_id]
    remove_index :spell_affects, [:id, :equipment_piece_id]
    remove_index :stat_affects, [:id, :equipment_piece_id]
    remove_index :slot_affects, [:id, :equipment_piece_id]
    remove_index :resistance_affects, [:id, :equipment_piece_id]
  end
end
