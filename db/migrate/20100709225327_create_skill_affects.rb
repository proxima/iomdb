class CreateSkillAffects < ActiveRecord::Migration
  def self.up
    create_table :skill_affects do |t|
      t.integer :equipment_piece_id
      t.integer :skill_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_affects
  end
end
