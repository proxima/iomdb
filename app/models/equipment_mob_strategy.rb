class EquipmentMobStrategy < ActiveRecord::Base
  belongs_to :equipment_monster

  has_one :greater_tank_prot, :class_name => 'DamageType'
  has_one :lesser_tank_prot1, :class_name => 'DamageType'
  has_one :lesser_tank_prot2, :class_name => 'DamageType'
  has_one :greater_party_prot, :class_name => 'DamageType'
  has_one :lesser_party_prot1, :class_name => 'DamageType'
  has_one :lesser_party_prot2, :class_name => 'DamageType'

end
