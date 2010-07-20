class EquipmentPiece < ActiveRecord::Base

  cattr_reader :per_page
  @@per_page = 30

  acts_as_versioned

  belongs_to :equipment_monster

  has_many :stat_affects
  has_many :resistance_affects
  has_many :skill_affects
  has_many :spell_affects
  has_many :slot_affects
  
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_numericality_of :klass, :weight, :tp_value

end
