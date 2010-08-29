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

end
