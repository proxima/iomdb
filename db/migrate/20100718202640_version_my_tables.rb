class VersionMyTables < ActiveRecord::Migration
  def self.up
    AlignmentLevel.create_versioned_table
    ArmorClassLevel.create_versioned_table
    DamageLevel.create_versioned_table
    DamageType.create_versioned_table
    EquipmentMonster.create_versioned_table
    EquipmentPiece.create_versioned_table
    Guild.create_versioned_table
    GuildType.create_versioned_table
    HungerLevel.create_versioned_table
    Race.create_versioned_table
    ResistanceAffect.create_versioned_table
    Skill.create_versioned_table
    SkillAffect.create_versioned_table
    SkillTrainSpec.create_versioned_table
    Slot.create_versioned_table
    SlotAffect.create_versioned_table
    Spell.create_versioned_table
    SpellAffect.create_versioned_table
    SpellTrainSpec.create_versioned_table
    Stat.create_versioned_table
    StatAffect.create_versioned_table
    StatLevel.create_versioned_table
  end

  def self.down
    AlignmentLevel.drop_versioned_table
    ArmorClassLevel.drop_versioned_table
    DamageLevel.drop_versioned_table
    DamageType.drop_versioned_table
    EquipmentMonster.drop_versioned_table
    EquipmentPiece.drop_versioned_table
    Guild.drop_versioned_table
    GuildType.drop_versioned_table
    HungerLevel.drop_versioned_table
    Race.drop_versioned_table
    ResistanceAffect.drop_versioned_table
    Skill.drop_versioned_table
    SkillAffect.drop_versioned_table
    SkillTrainSpec.drop_versioned_table
    Slot.drop_versioned_table
    SlotAffect.drop_versioned_table
    Spell.drop_versioned_table
    SpellAffect.drop_versioned_table
    SpellTrainSpec.drop_versioned_table
    Stat.drop_versioned_table
    StatAffect.drop_versioned_table
    StatLevel.drop_versioned_table
  end
end
