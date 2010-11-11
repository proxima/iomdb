class EquipmentPiece < ActiveRecord::Base

  belongs_to :equipment_monster

  has_many :stat_affects, :dependent => :destroy
  has_many :resistance_affects, :dependent => :destroy
  has_many :skill_affects, :dependent => :destroy
  has_many :spell_affects, :dependent => :destroy
  has_many :slot_affects, :dependent => :destroy
  has_many :weapon_damage_affects, :dependent => :destroy
  
  validates_presence_of :name

  validates_numericality_of :klass, :weight
  validates_numericality_of :tp_value, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 10
  validates_numericality_of :rufrin_price, :greater_than_or_equal_to => 0

  def self.find_by_gab_list(gab_list)
    rg = Regexp.new(/^ \d*    \d   ([a-zA-Z '\-()]*)([0-9,]*)\s*\w*/)

    ret = {}

    for line in gab_list
      match_results = rg.match line
      if match_results
        item_name = match_results[1]
        cost = match_results[2]

        item_name.strip!
        cost.delete! ','

        pieces = EquipmentPiece.find(:all, :conditions => ["name = ?", "#{item_name}%"])
        if pieces.size == 0
          pieces = EquipmentPiece.find(:all, :conditions => ["name LIKE ?", "#{item_name}%"])
        end

        if pieces.size > 0
          ret[pieces[0]] = cost
        else
#          puts "Couldn't find item: #{item_name}"
        end
      end
    end
    return ret
  end

end
