class CreateEquipmentPieceLists < ActiveRecord::Migration
  def self.up
    create_table :equipment_piece_lists do |t|
      t.string :name
      t.integer :admin_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_piece_lists
  end
end
