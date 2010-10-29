class ResistanceAffect < ActiveRecord::Base

  belongs_to :equipment_piece
  has_one :damage_type

  validates_presence_of :equipment_piece_id, :damage_type_id, :value
  validates_numericality_of :equipment_piece_id, :damage_type_id, :value

end
