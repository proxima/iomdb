class CreateGuilds < ActiveRecord::Migration
  def self.up
    create_table :guilds do |t|
      t.string :name
      t.integer :guild_type_id
      t.text :location
      t.integer :levels

      t.timestamps
    end
  end

  def self.down
    drop_table :guilds
  end
end
