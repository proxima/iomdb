#!/usr/bin/ruby

@lines = IO.readlines("/var/www/dev/cmlee/IoM/lib/eq/index.html")

armor_name_regex = Regexp.new(/<span class="eqb">#<\/span>([a-zA-Z '-\\(\\)\/]*)<span class="eqb">/)
tp_regex = Regexp.new(/<\/span>\s*([\d?\*]*)\s*<span class="eqb">/)

results = {}

for line in @lines
  item_name = nil
  tp_value = nil

  pieces = line.split('|')
  if pieces.size == 4
    armor_name_match = armor_name_regex.match pieces[0]
    item_name = armor_name_match[1] unless armor_name_match.nil?
    item_name.strip! unless item_name.nil?
    if item_name
      tp_match = tp_regex.match pieces[2]
      if tp_match and tp_match[1] and tp_match[1] == '?'
        tp_value = -1
      else
        tp_value = tp_match[1].to_i unless tp_match.nil?
      end
      results[item_name] = tp_value
    end
  elsif pieces.size == 5
    armor_name_match = armor_name_regex.match pieces[0]
    item_name = armor_name_match[1] unless armor_name_match.nil?
    item_name.strip! unless item_name.nil?
    if item_name
      tp_match = tp_regex.match pieces[3]
      if tp_match and tp_match[1] and tp_match[1] == '?'
        tp_value = -1
      else
        tp_value = tp_match[1].to_i unless tp_match.nil?
      end
      results[item_name] = tp_value
    end
  end
end

results.each_pair do |k,v|
  piece = EquipmentPiece.find_by_name(k)
  if piece
    piece.tp_value = v
    piece.save
  end
end
