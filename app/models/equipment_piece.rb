class EquipmentPiece < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_monster

  has_many :stat_affects
  has_many :resistance_affects
  has_many :skill_affects
  has_many :spell_affects
  has_many :slot_affects
  
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_numericality_of :klass, :weight, :tp_value

  def stat_line
    ret = ""

    for sa in stat_affects do
      ret = ret + sa.value.to_s + Stat.find(sa.stat_id).abbreviation + ', '
    end

    for sa in skill_affects do
      ret = ret + sa.value.to_s + Skill.find(sa.skill_id).name + ', '
    end

    for sa in spell_affects do
      ret = ret + sa.value.to_s + Spell.find(sa.skill_id).name + ', '
    end

    for ra in resistance_affects do
      ret = ret + ra.value.to_s + DamageType.find(ra.damage_type_id).name + 'Res, '
    end

    ret = ret + "Special: " + special if special
   
    ret.chop!.chop! if ret[-2,2] == ', '

    return ret
  end

end
