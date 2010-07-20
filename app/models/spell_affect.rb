class SpellAffect < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_piece
  has_one :spell

  validates_presence_of :equipment_piece_id, :spell_id, :value
  validates_numericality_of :equipment_piece_id, :spell_id, :value

end
