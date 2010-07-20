class AddAverageHeightToRace < ActiveRecord::Migration
  def self.up
    add_column :races, :average_height, :integer
  end

  def self.down
    remove_column :races, :average_height
  end
end
