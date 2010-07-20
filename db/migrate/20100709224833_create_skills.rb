class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :name
      t.integer :guild_id
      t.integer :base_cost

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
