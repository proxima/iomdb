class EquipmentMobStrategy < ActiveRecord::Base
  belongs_to :equipment_monster

  has_one :greater_tank_prot, :class_name => 'DamageType'
  has_one :lesser_tank_prot1, :class_name => 'DamageType'
  has_one :lesser_tank_prot2, :class_name => 'DamageType'
  has_one :greater_party_prot, :class_name => 'DamageType'
  has_one :lesser_party_prot1, :class_name => 'DamageType'
  has_one :lesser_party_prot2, :class_name => 'DamageType'

  after_save :modify_mob_updated_time

  def modify_mob_updated_time
    self.equipment_monster.updated_at = self.updated_at
    self.equipment_monster.save
  end

  def can_follow(s2)
    gshield_ok = true

    if !self.greater_party_prot_id.nil? and !s2.greater_party_prot_id.nil?
      if self.greater_party_prot_id != s2.greater_party_prot_id
        gshield_ok = false
      end
    end

    gshield_ok = false if self.greater_party_prot_id.nil? or s2.greater_party_prot_id.nil?
 
    lshield_ok = true

    a1 = []
    a2 = []
    
    a1 << self.lesser_party_prot1_id if !self.lesser_party_prot1_id.nil?   
    a1 << self.lesser_party_prot2_id if !self.lesser_party_prot2_id.nil?
    a2 << s2.lesser_party_prot1_id if !s2.lesser_party_prot1_id.nil?   
    a2 << s2.lesser_party_prot2_id if !s2.lesser_party_prot2_id.nil?

    if a2.size == 2
      if a1.size == 1 and a2.index(a1[0])
        lshield_ok = false
      end
      
      if a1.size == 2 and a1 != a2
        lshield_ok = false
      end
    elsif a2.size == 1
      if a1.size == 2 and a1.index(a2[0]).nil?
        lshield_ok = false
      end
    end
  
    return true if gshield_ok == true and lshield_ok == true
    return false
  end
end
