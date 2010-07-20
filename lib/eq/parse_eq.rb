#!/usr/bin/ruby

def do_eq_parse
  @lines = IO.readlines("/var/www/dev/cmlee/IoM/lib/eq/equipment.txt")

  for line in @lines do
    parts = line.split(';')
    id = parts[0].to_i
    name = parts[1][1..-2]
    slot = parts[2][1..-2]
    klass = parts[3][1..-2].to_i
    tp_value = parts[4][1..-2].to_i
    special = parts[5][1..-2]
    mob = parts[6][1..-2]

    piece = EquipmentPiece.new
    piece.id = id
    piece.name = name
    piece.klass = klass
    piece.tp_value = tp_value
    piece.special = special
    
    if EquipmentMonster.find_by_name(mob).nil?
      monster = EquipmentMonster.new
      monster.name = mob
      monster.save
    end

    if EquipmentMonster.find_by_name(mob)
      piece.equipment_monster_id = EquipmentMonster.find_by_name(mob).id
      piece.save
    end
  end
end

def do_bonus_parse
  @lines = IO.readlines("bonuses.txt")

  for line in @lines do
  end
end

def do_bonus_types_parse
  @lines = IO.readlines("bonus_types.txt")

  for line in @lines do
  end
end

do_eq_parse
