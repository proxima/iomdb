class AddIdToEquipmentPieceListEntry < ActiveRecord::Migration
  def self.up
    add_column :equipment_piece_list_entries, :id, :primary_key
  end

  def self.down
    remove_column :equipment_piece_list_entries, :id
  end
end
