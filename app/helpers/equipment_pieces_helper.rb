module EquipmentPiecesHelper

  def stat_line(piece)
    ret = ""

    for sa in piece.stat_affects do
      temp = Stat.find(sa.stat_id)
      ret = ret + sa.value.to_s + ' ' + link_to(temp.abbreviation, temp) + ', '
    end

    for sa in piece.skill_affects do
      temp = Skill.find(sa.skill_id)
      ret = ret + sa.value.to_s + ' ' + link_to(temp.name, temp) + ', '
    end

    for sa in piece.spell_affects do
      temp = Spell.find(sa.spell_id)
      ret = ret + sa.value.to_s + ' ' + link_to(temp.name, temp) + ', '
    end

    for ra in piece.resistance_affects do
      temp = DamageType.find(ra.damage_type_id)
      ret = ret + ra.value.to_s + ' ' + link_to(temp.name, temp) + ' Res, '
    end

    ret = ret + "Special: " + piece.special if piece.special

    ret.chop!.chop! if ret[-2,2] == ', '

    return ret
  end

end
