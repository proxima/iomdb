class AddRufrinPriceToEquipmentPiece < ActiveRecord::Migration
  def self.up
    add_column :equipment_pieces, :rufrin_price, :integer
  end

  def self.down
    remove_column :equipment_pieces, :rufrin_price
  end
end
