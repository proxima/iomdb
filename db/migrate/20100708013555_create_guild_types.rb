class CreateGuildTypes < ActiveRecord::Migration
  def self.up
    create_table :guild_types do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end

  def self.down
    drop_table :guild_types
  end
end
