class AddIndexToSpells < ActiveRecord::Migration
  def self.up
    add_index :spells, [:id, :name]
  end

  def self.down
    remove_index :spells, [:id, :name]
  end
end
