class SlotAffect < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_piece
  has_one :slot

  validates_presence_of :equipment_piece_id, :slot_id
  validates_numericality_of :equipment_piece_id, :slot_id

end
