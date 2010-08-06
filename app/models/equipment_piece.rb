class EquipmentPiece < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_monster

  has_many :stat_affects
  has_many :resistance_affects
  has_many :skill_affects
  has_many :spell_affects
  has_many :slot_affects
  
  validates_presence_of :name

  validates_numericality_of :klass, :weight
  validates_numericality_of :tp_value, :greater_than_or_equal_to => -1, :less_than_or_equal_to => 10

end
