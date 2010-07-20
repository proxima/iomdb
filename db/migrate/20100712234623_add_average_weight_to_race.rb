class AddAverageWeightToRace < ActiveRecord::Migration
  def self.up
    add_column :races, :average_weight, :integer
  end

  def self.down
    remove_column :races, :average_weight
  end
end
