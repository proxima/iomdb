module EquipmentPiecesHelper

  def armor_options
    ret = {}
    ret[:armors] = []
    ret[:armors] << ['Head', 'head']
    ret[:armors] << ['Eyes', 'eyes']
    ret[:armors] << ['Neck', 'neck']
    ret[:armors] << ['Cloak', 'cloak']
    ret[:armors] << ['Amulet', 'amulet']
    ret[:armors] << ['Torso', 'torso']
    ret[:armors] << ['Arms', 'arms']
    ret[:armors] << ['R. Arm', 'right arm']
    ret[:armors] << ['L. Arm', 'left arm']
    ret[:armors] << ['Hands', 'hands']
    ret[:armors] << ['R. Hand', 'right hand']
    ret[:armors] << ['L. Hand', 'left hand']
    ret[:armors] << ['Finger', 'finger']
    ret[:armors] << ['R. Finger', 'right finger']
    ret[:armors] << ['L. Finger', 'left finger']
    ret[:armors] << ['Belt', 'belt']
    ret[:armors] << ['Legs', 'legs']
    ret[:armors] << ['R. Leg', 'right leg']
    ret[:armors] << ['L. Leg', 'left leg']
    ret[:armors] << ['Feet', 'feet']
    ret[:armors] << ['R. Foot', 'right foot']
    ret[:armors] << ['L. Foot', 'left foot']
    ret[:armors] << ['Multi-Slot', 'multislot']

    ret[:weapons] = []
    ret[:weapons] << ['Slashing', 'slashing']
    ret[:weapons] << ['Piercing', 'piercing']
    ret[:weapons] << ['Blunt', 'blunt']
    ret[:weapons] << ['Whipping', 'whipping']
    ret[:weapons] << ['Shield', 'shield']

    ret[:admin] = []
    ret[:admin] << ['(Unclassified)', 'unclassified']

    return ret
  end

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
      ret = ret + ra.value.to_s + ' ' + link_to(temp.name + ' Res', temp) + ', '
    end

    ret = ret + "Special: " + piece.special if piece.special

    ret.chop!.chop! if ret[-2,2] == ', '

    return ret
  end

end
