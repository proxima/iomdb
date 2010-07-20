module ReincHelper
  @multipliers = [ 1, 2, 2, 1.75, 1 + (6.0/7.0), 1 + (11.0/13.0), 1.75, 1 + (2.0/3.0), 1 + (22.0/35.0), 1 + (11.0/19.0), 1 + (97.0/180.0), 1 + (139.0/277.0), \
                 1 + (97.0/208.0), 1 + (267.0/610.0), 1 + (360.0/877.0), 1 + (479.0/1237.0), 1 + (157.0/429.0), 1 + (813.0/2344.0), 1 + (1041.0/3157.0), \
                 1 + (1317.0/4198.0), 1 + (1651.0/5515.0), 1 + (2052.0/7166.0) ]

  def self.print_skill_costs(skill, race)

    base_cost = skill.base_cost
    skill_rate = race.skill_rate
  
    base_cost = base_cost * (skill_rate.to_f / 100.0)

    cost_counter = base_cost
    total = 0
    i = 10
 
    puts "Costs for #{skill.name} to:"

    @multipliers.each do |mult|
      cost_counter = (cost_counter * mult).floor
      ratio = cost_counter / base_cost
      total = total + cost_counter

      puts "  #{i}%: [#{base_cost}*#{ratio}] [Total so far: #{total}]"
      puts " ----- SKILL MAX ----- " if i == race.skill_max
   
      i = i + 5
    end
  end

  def self.print_spell_costs(spell, race)
	
    base_cost = spell.base_cost
    spell_rate = race.spell_rate

    base_cost = base_cost * (spell_rate.to_f / 100.0)

    cost_counter = base_cost
    total = 0
    i = 10
 
    puts "Costs for #{spell.name} to:"

    @multipliers.each do |mult|
      cost_counter = (cost_counter * mult).floor
      ratio = cost_counter / base_cost
      total = total + cost_counter

      puts "  #{i}%: [#{base_cost}*#{ratio}] [Total so far: #{total}]"
      puts " ----- SPELL MAX ----- " if i == race.spell_max

      i = i + 5
    end
  end  
end
