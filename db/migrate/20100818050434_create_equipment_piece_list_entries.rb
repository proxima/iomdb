class CreateEquipmentPieceListEntries < ActiveRecord::Migration
  def self.up
    create_table :equipment_piece_list_entries, :id => false do |t|
      t.references :equipment_piece, :equipment_piece_list      
      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_piece_list_entries
  end
end
