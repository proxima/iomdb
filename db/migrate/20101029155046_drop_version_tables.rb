class DropVersionTables < ActiveRecord::Migration
  def self.up
    drop_table :alignment_level_versions
    drop_table :armor_class_level_versions
    drop_table :damage_level_versions
    drop_table :damage_type_versions
    drop_table :equipment_monster_versions
    drop_table :equipment_piece_versions
    drop_table :guild_type_versions
    drop_table :guild_versions
    drop_table :hunger_level_versions
    drop_table :race_versions
    drop_table :resistance_affect_versions
    drop_table :skill_affect_versions
    drop_table :skill_train_spec_versions
    drop_table :skill_versions
    drop_table :slot_affect_versions
    drop_table :slot_versions
    drop_table :spell_affect_versions
    drop_table :spell_train_spec_versions
    drop_table :spell_versions
    drop_table :stat_affect_versions
    drop_table :stat_level_versions
    drop_table :stat_versions 
  end

  def self.down
  end
end
