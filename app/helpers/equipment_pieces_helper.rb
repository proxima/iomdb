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

  def slot_line(piece)
  
    if piece.slot_affects.size == 1
      temp = Slot.find(piece.slot_affects[0].slot_id)
      return temp.name
    else
      @foot_slots = [ Slot.find_by_name('left foot').id, Slot.find_by_name('right foot').id ]
      @hand_slots = [ Slot.find_by_name('left hand').id, Slot.find_by_name('right hand').id ]
      @leg_slots = [ Slot.find_by_name('left leg').id, Slot.find_by_name('right leg').id ]
      @arm_slots = [ Slot.find_by_name('left arm').id, Slot.find_by_name('right arm').id ]

      if piece.slot_affects.size == 2 and @foot_slots.include?(piece.slot_affects[0].slot_id) == true and @foot_slots.include?(piece.slot_affects[1].slot_id) == true
        return "Feet"
      elsif piece.slot_affects.size == 2 and @hand_slots.include?(piece.slot_affects[0].slot_id) == true and @hand_slots.include?(piece.slot_affects[1].slot_id) == true
        return "Hands"
      elsif piece.slot_affects.size == 2 and @leg_slots.include?(piece.slot_affects[0].slot_id) == true and @leg_slots.include?(piece.slot_affects[1].slot_id) == true
        return "Legs"
      elsif piece.slot_affects.size == 2 and @arm_slots.include?(piece.slot_affects[0].slot_id) == true and @arm_slots.include?(piece.slot_affects[1].slot_id) == true
        return "Arms"
      else
       ret = ""
        for sa in piece.slot_affects do
          temp = Slot.find(sa.slot_id)
          ret = ret + temp.abbreviation.to_s + ', '
        end
        ret.chop!.chop! if ret[-2,2] == ', '
        return ret
      end
    end
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

    for wa in piece.weapon_damage_affects do
      damage_type = DamageType.find(wa.damage_type_id) 
      damage_level = WeaponDamageLevel.find(wa.weapon_damage_level_id)

      ret = ret + link_to(damage_type.name + ' Damage', damage_type) + ' (' + damage_level.name + '), '
    end

    ret = ret + "Special: " + piece.special if piece.special and !piece.special.empty?

    ret.chop!.chop! if ret[-2,2] == ', '

    return ret
  end

  def parchment_parse(parchment_text)
    @eq_pieces = []
    @not_found = []

    parchment_text.each_line do |line|
      temp = line.chomp
      piece = EquipmentPiece.find_by_name(temp)
      if piece
        @eq_pieces << piece
      else
        @not_found << temp
      end
    end

    return @eq_pieces, @not_found
  end

end
