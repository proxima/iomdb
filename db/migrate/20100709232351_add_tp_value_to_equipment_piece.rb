class AddTpValueToEquipmentPiece < ActiveRecord::Migration
  def self.up
    add_column :equipment_pieces, :tp_value, :integer
  end

  def self.down
    remove_column :equipment_pieces, :tp_value
  end
end
