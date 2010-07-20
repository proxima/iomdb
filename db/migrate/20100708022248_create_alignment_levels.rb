class CreateAlignmentLevels < ActiveRecord::Migration
  def self.up
    create_table :alignment_levels do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :alignment_levels
  end
end
