class CreateSpells < ActiveRecord::Migration
  def self.up
    create_table :spells do |t|
      t.string :name
      t.integer :guild_id
      t.integer :base_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :spells
  end
end
