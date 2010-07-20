class AddSpecialToEquipmentPiece < ActiveRecord::Migration
  def self.up
    add_column :equipment_pieces, :special, :string
  end

  def self.down
    remove_column :equipment_pieces, :special
  end
end
