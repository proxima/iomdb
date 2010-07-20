#!/usr/bin/ruby

@lines = IO.readlines("/var/www/dev/cmlee/IoM/lib/eq/index.html")

links_regex = Regexp.new(/<a id="([a-zA-Z ]*)"><\/a>/)
armor_name_regex = Regexp.new(/<span class="eqb">#<\/span>([a-zA-Z '-\\(\\)\/]*)<span class="eqb">/)
tp_regex = Regexp.new(/<\/span>\s*([\d?\*]*)\s*<span class="eqb">/)
mob_regex = Regexp.new(/<\/span>\s*([a-zA-Z -?]*)\s*<span class="eqb">#<\/span>/)
stats_regex = Regexp.new(/<\/span>\s*([a-zA-Z0-9 (,)_;.'\/:?\-~&+]*)\s*<span class="eqb">/)
wc_regex = Regexp.new(/<\/span>\s*([\d?*-]*)\s*<span class="eqb">/)

cur_slot = ""

def string_to_slots(slot_str)
  if slot_str == "head"
    return [ 3 ]
  elsif slot_str == "eyes"
    return [ 4 ]
  elsif slot_str == "neck"
    return [ 5 ]
  elsif slot_str == "cloak"
    return [ 6 ]
  elsif slot_str == "amulet"
    return [ 8 ]
  elsif slot_str == "torso"
    return [ 7 ]
  elsif slot_str == "arms"
    return [ 9, 11 ]
  elsif slot_str == "larm"
    return [ 9 ]
  elsif slot_str == "rarm"
    return [ 11 ]
  elsif slot_str == "hands"
    return [ 25, 26 ]
  elsif slot_str == "lhand"
    return [ 25 ]
  elsif slot_str == "rhand"
    return [ 26 ]
  elsif slot_str == "finger"
    return [ 27 ]
  elsif slot_str == "lfinger"
    return [ 10 ]
  elsif slot_str == "rfinger"
    return [ 12 ]
  elsif slot_str == "belt"
    return [ 13 ]
  elsif slot_str == "legs"
    return [ 14, 15 ]
  elsif slot_str == "lleg"
    return [ 14 ]
  elsif slot_str == "rleg"
    return [ 15 ]
  elsif slot_str == "feet"
    return [ 16, 17 ]
  elsif slot_str == "lfoot"
    return [ 16 ]
  elsif slot_str == "rfoot"
    return [ 17 ]
  elsif slot_str == "multislot"
    return [ ]
  elsif slot_str == "slashing"
    return [ 22 ]
  elsif slot_str == "blunt"
    return [ 23 ]
  elsif slot_str == "piercing"
    return [ 21 ]
  elsif slot_str == "whipping"
    return [ 20 ]
  elsif slot_str == "shield"
    return [ 24 ]
  end
end

slots = nil

for line in @lines
  links_match = links_regex.match line

  item_name = nil
  tp_value = nil
  mob = nil
  special = nil
  wc = nil

  if links_match
    slots = nil
    cur_slot = links_match[1]
    cur_slot.strip!
    slots = string_to_slots(cur_slot)
  end
  
  pieces = line.split('|')
  if pieces.size == 4
    armor_name_match = armor_name_regex.match pieces[0]
    item_name = armor_name_match[1] unless armor_name_match.nil?
    item_name.strip! unless item_name.nil?

    if item_name
      tp_match = tp_regex.match pieces[2]
      tp_value = tp_match[1].to_i unless tp_match.nil?

      mob_match = mob_regex.match pieces[3]
      mob = mob_match[1] unless mob_match.nil?
      mob.strip! unless mob.nil?

      stats_match = stats_regex.match pieces[1]
      special = stats_match[1] unless stats_match.nil?
      special.strip! unless special.nil?

    end
  elsif pieces.size == 5
    weapon_name_match = armor_name_regex.match pieces[0]
    item_name = weapon_name_match[1] unless weapon_name_match.nil?    
    item_name.strip! unless item_name.nil?

    if item_name
      tp_match = tp_regex.match pieces[3]
      tp_value = tp_match[1].to_i unless tp_match.nil?

      stats_match = stats_regex.match pieces[2]
      special = stats_match[1] unless stats_match.nil?
      special.strip! unless special.nil?

      mob_match = mob_regex.match pieces[4]
      mob = mob_match[1] unless mob_match.nil?
      mob.strip! unless mob.nil?

      wc_match = wc_regex.match pieces[1]
      wc = wc_match[1].to_i unless wc_match.nil?
    end
  end

  if item_name and slots
    eq = EquipmentPiece.new
    eq.name = item_name
    eq.special = special
    eq.tp_value = tp_value

    monster = EquipmentMonster.find_by_name(mob)
    if monster
      eq.equipment_monster_id = monster.id
    else
      monster = EquipmentMonster.new
      monster.name = mob
      monster.save
      eq.equipment_monster_id = monster.id
    end

    if wc
      eq.klass = wc.to_i
    end

    eq.klass = 0 if eq.klass.nil?
    eq.weight = 0 if eq.weight.nil?
 
    eq.save
    for slot in slots
      sa = SlotAffect.new
      sa.equipment_piece_id = eq.id
      sa.slot_id = slot
      sa.save
    end
  end  

#  puts "#{item_name}|#{wc}|#{special}|#{tp_value}|#{mob}" if item_name and slots
end
