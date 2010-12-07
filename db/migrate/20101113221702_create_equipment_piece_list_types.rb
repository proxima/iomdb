class CreateEquipmentPieceListTypes < ActiveRecord::Migration
  def self.up
    create_table :equipment_piece_list_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_piece_list_types
  end
end
