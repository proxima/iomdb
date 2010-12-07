class AddEquipmentPieceListTypeIdToEquipmentPieceList < ActiveRecord::Migration
  def self.up
    add_column :equipment_piece_lists, :equipment_piece_list_type_id, :integer
  end

  def self.down
    remove_column :equipment_piece_lists, :equipment_piece_list_type_id
  end
end
