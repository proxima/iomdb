class CreateEquipmentPieces < ActiveRecord::Migration
  def self.up
    create_table :equipment_pieces do |t|
      t.string :name
      t.integer :equipment_monster_id
      t.integer :klass
      t.integer :weight

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_pieces
  end
end
