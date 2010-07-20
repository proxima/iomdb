class RemoveGuildIdFromSpell < ActiveRecord::Migration
  def self.up
    remove_column :spells, :guild_id
  end

  def self.down
    add_column :spells, :guild_id, :integer
  end
end
