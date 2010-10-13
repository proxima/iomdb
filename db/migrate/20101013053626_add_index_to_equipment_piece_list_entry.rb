class AddIndexToEquipmentPieceListEntry < ActiveRecord::Migration
  def self.up
    add_index :equipment_piece_list_entries, :equipment_piece_list_id
  end

  def self.down
    remove_index :equipment_piece_list_entries, :equipment_piece_list_id
  end
end
