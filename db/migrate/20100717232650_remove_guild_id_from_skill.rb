class RemoveGuildIdFromSkill < ActiveRecord::Migration
  def self.up
    remove_column :skills, :guild_id
  end

  def self.down
    add_column :skills, :guild_id, :integer
  end
end
