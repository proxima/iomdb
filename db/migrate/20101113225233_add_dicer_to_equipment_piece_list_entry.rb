class AddDicerToEquipmentPieceListEntry < ActiveRecord::Migration
  def self.up
    add_column :equipment_piece_list_entries, :dicer, :string
  end

  def self.down
    remove_column :equipment_piece_list_entries, :dicer
  end
end
