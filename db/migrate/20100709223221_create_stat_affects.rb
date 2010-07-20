class CreateStatAffects < ActiveRecord::Migration
  def self.up
    create_table :stat_affects do |t|
      t.integer :equipment_piece_id
      t.integer :stat_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :stat_affects
  end
end
