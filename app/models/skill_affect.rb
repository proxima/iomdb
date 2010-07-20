class SkillAffect < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_piece
  has_one :skill

  validates_presence_of :equipment_piece_id, :skill_id, :value
  validates_numericality_of :equipment_piece_id, :skill_id, :value

end
