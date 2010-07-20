class CreateSkillTrainSpecs < ActiveRecord::Migration
  def self.up
    create_table :skill_train_specs do |t|
      t.integer :skill_id
      t.integer :guild_id
      t.integer :level
      t.integer :max

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_train_specs
  end
end
