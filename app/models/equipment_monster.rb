class EquipmentMonster < ActiveRecord::Base

  acts_as_versioned

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :equipment_pieces, :dependent => :destroy, :order => 'tp_value DESC, name ASC'
  has_one :equipment_mob_strategy, :dependent => :destroy

end
