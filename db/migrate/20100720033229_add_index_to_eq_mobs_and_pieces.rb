class AddIndexToEqMobsAndPieces < ActiveRecord::Migration
  def self.up
    add_index :equipment_monsters, [:id, :name]
    add_index :equipment_pieces, [:id, :name]
  end

  def self.down
    remove_index :equipment_monsters, [:id, :name]
    remove_index :equipment_pieces, [:id, :name]
  end
end
