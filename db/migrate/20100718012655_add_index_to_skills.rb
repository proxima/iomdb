class AddIndexToSkills < ActiveRecord::Migration
  def self.up
    add_index :skills, [:id, :name]
  end

  def self.down
    remove_index :skills, [:id, :name]
  end
end
