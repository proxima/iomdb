class CreateStatLevels < ActiveRecord::Migration
  def self.up
    create_table :stat_levels do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :stat_levels
  end
end
