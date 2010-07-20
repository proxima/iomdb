class CreateSlotAffects < ActiveRecord::Migration
  def self.up
    create_table :slot_affects do |t|
      t.integer :slot_id
      t.integer :equipment_piece_id

      t.timestamps
    end
  end

  def self.down
    drop_table :slot_affects
  end
end
