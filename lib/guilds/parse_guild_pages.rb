#!/usr/bin/ruby

def do_guild_parse
  @guild_files = []
  Dir.glob("/var/www/dev/cmlee/IoM/lib/guilds/guild_files/*.txt") { |filename| @guild_files << filename }

  guild_name_regex = Regexp.new(/Guild info on ([a-zA-Z ]*). A ([a-zA-Z ]*) level ([a-zA-Z ]*) guild./)
  level_regex = Regexp.new(/\|\s+\[Level (\d*)\]\s+\|/)
  new_spells_regex = Regexp.new(/New Spells:/)
  new_skills_regex = Regexp.new(/New Skills:/)
  which_sksp_regex = Regexp.new(/<a href="#[a-zA-Z ]*">([a-zA-Z ]*)<\/a>/)
  skill_header_regex = Regexp.new(/Help on skill\s+:\s+([a-zA-Z ]*)/)
  spell_header_regex = Regexp.new(/Help on spell\s+:\s+([a-zA-Z ]*)/)
  base_cost_regex = Regexp.new(/Base Experience Cost\s+:\s+(\d+)/)
  grad_training_regex = Regexp.new(/It can be trained up to (\d*) percent of your skill max at level (\d*)./)

  master_hash = {}

  for filename in @guild_files do
    @lines = IO.readlines(filename)

    guild_name = nil
    last_level = nil
    cur_sksp = nil
    is_skill = false

    for line in @lines do

      if guild_name.nil?
        matchdata = guild_name_regex.match(line)
        if matchdata
          guild_name = matchdata[1]
          master_hash[guild_name.to_sym] = {}
          master_hash[guild_name.to_sym][:skills] = {}
          master_hash[guild_name.to_sym][:spells] = {}
          master_hash[guild_name.to_sym][:guild_level] = matchdata[2]
          master_hash[guild_name.to_sym][:base_guilds] = matchdata[3].split(' and ')
        end
      end

      matchdata = level_regex.match(line)
      if matchdata
        last_level = matchdata[1].to_i
        if guild_name.nil?
   #       puts "#{filename} : Last Level: #{last_level}"
        end
      end

      matchdata = new_spells_regex.match(line)
      if matchdata
        is_skill = false
      end
    
      matchdata = new_skills_regex.match(line)
      if matchdata
        is_skill = true
      end

      linecopy = line.dup
      matchdata = which_sksp_regex.match(linecopy)
      while matchdata
        if guild_name.nil?
  #        puts "#{filename}"
  #        p matchdata.captures
        else
          for sksp_name in matchdata.captures do
            if is_skill
              if master_hash[guild_name.to_sym][:skills][sksp_name.downcase.to_sym].nil?
                master_hash[guild_name.to_sym][:skills][sksp_name.downcase.to_sym] = {}
              end
              master_hash[guild_name.to_sym][:skills][sksp_name.downcase.to_sym][:min_level] = last_level
            else
              if master_hash[guild_name.to_sym][:spells][sksp_name.downcase.to_sym].nil?
                master_hash[guild_name.to_sym][:spells][sksp_name.downcase.to_sym] = {}
              end
              master_hash[guild_name.to_sym][:spells][sksp_name.downcase.to_sym][:min_level] = last_level            
            end
          end
        end
        linecopy = matchdata.post_match
        matchdata = which_sksp_regex.match(linecopy)
      end

      matchdata = skill_header_regex.match(line)
      if matchdata
        is_skill = true
        cur_sksp = matchdata[1]
        if guild_name.nil?
  #        puts "Current skill: #{cur_sksp}"
        end
      end

      matchdata = spell_header_regex.match(line)
      if matchdata
        is_skill = false
        cur_sksp = matchdata[1]
        if guild_name.nil?
  #        puts "Current spell: #{cur_sksp}"
        end
      end

      matchdata = base_cost_regex.match(line)
      if matchdata
        cost = matchdata[1].to_i
        if guild_name.nil?
  #        puts "Base cost: #{cost}"
        else
          if is_skill
            if master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym].nil?
              master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym] = {}
            end
            master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym][:base_cost] = cost
          else
            if master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym].nil?
              master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym] = {}
            end
            master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym][:base_cost] = cost
          end
        end
      end

      matchdata = grad_training_regex.match(line)
      if matchdata
        percent = matchdata[1].to_i
        level = matchdata[2].to_i
        if guild_name
          if is_skill
            if master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym].nil?
              master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym] = {}
            end
            if master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym]["graduated training".to_sym].nil?
              master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym]["graduated training".to_sym] = {}
            end
            master_hash[guild_name.to_sym][:skills][cur_sksp.downcase.to_sym]["graduated training".to_sym][level] = percent            
          else
            if master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym].nil?
              master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym] = {}
            end
            if master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym]["graduated training".to_sym].nil?
              master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym]["graduated training".to_sym] = {}
            end
            master_hash[guild_name.to_sym][:spells][cur_sksp.downcase.to_sym]["graduated training".to_sym][level] = percent
          end
        end
      end
    end
  end
  master_hash
end

def create_sksp
  master_hash = do_guild_parse

  master_hash.each_pair do |k,v|
    v[:skills].each_pair do |k2,v2|
      sk = Skill.new
      sk.name = k2.to_s.titleize
      sk.base_cost = v2[:base_cost]
      sk.save
    end
    v[:spells].each_pair do |k2,v2|
      sp = Spell.new
      sp.name = k2.to_s.titleize
      sp.base_cost = v2[:base_cost]
      sp.save
    end
  end
end

def create_guilds
  master_hash = do_guild_parse
  master_hash.each_pair do |k,v|
    g = Guild.new
    g.name = k.to_s.titleize
    g.levels = 10
    g.location = "Not yet determined."
    g.guild_type_id = 0
    g.save
  end
end

def create_training_info
  master_hash = do_guild_parse
  master_hash.each_pair do |k,v|
    g = Guild.find_by_name(k.to_s.titleize)
    if g
      v[:skills].each_pair do |k2,v2|
        sk = Skill.find_by_name(k2.to_s.titleize)
        if v2["graduated training".to_sym]
          v2["graduated training".to_sym].each_pair do |k3,v3|
            sts = SkillTrainSpec.new
            sts.guild_id = g.id
            sts.skill_id = sk.id
            sts.level = k3.to_i
            sts.max = v3.to_i
            sts.save
          end
        elsif v2[:min_level]
          min_level = v2[:min_level]
          sts = SkillTrainSpec.new
          sts.guild_id = g.id
          sts.skill_id = sk.id
          sts.level = min_level
          sts.max = 100
          sts.save
        else
          skill_name = sk.name
          puts "#{skill_name} has no level information."
        end
      end
      v[:spells].each_pair do |k2,v2|
        sp = Spell.find_by_name(k2.to_s.titleize)
        if v2["graduated training".to_sym]
          v2["graduated training".to_sym].each_pair do |k3,v3|
            sts = SpellTrainSpec.new
            sts.guild_id = g.id
            sts.spell_id = sp.id
            sts.level = k3.to_i
            sts.max = v3.to_i
            sts.save
          end
        elsif v2[:min_level]
          min_level = v2[:min_level]
          sts = SpellTrainSpec.new
          sts.guild_id = g.id
          sts.spell_id = sp.id
          sts.level = min_level
          sts.max = 100
          sts.save
        else
          spell_name = sp.name
          puts "#{spell_name} has no level information."
        end
      end
    end
  end
end

#master_hash.each_pair do |k,v|
#  puts "Guild Name: #{k}"
#  v[:skills].each_pair do |k2,v2|
#    puts " Skill: #{k2}"
#    puts "  Base cost: #{v2[:base_cost]}" if v2[:base_cost]
#    puts "  Min Level: #{v2[:min_level]}" if v2[:min_level]
#  end
#  v[:spells].each_pair do |k2,v2|
#    puts " Spell: #{k2}"
#    puts "  Base cost: #{v2[:base_cost]}" if v2[:base_cost]
#    puts "  Min Level: #{v2[:min_level]}" if v2[:min_level]
#  end
#  puts " Guild Level: #{v[:guild_level]}" if v[:guild_level]
#  puts " Base Guilds: "
#  for base_guild in v[:base_guilds]
#    puts "  #{base_guild}"
#  end
#end

#p master_hash
