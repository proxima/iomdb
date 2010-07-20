class AddIndexToGuilds < ActiveRecord::Migration
  def self.up
    add_index :guilds, [:id, :name]
  end

  def self.down
    remove_index :guilds, [:id, :name]
  end
end
