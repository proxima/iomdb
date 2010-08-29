class SlotAffect < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_piece
  has_one :slot

  validates_presence_of :equipment_piece_id, :slot_id
  validates_numericality_of :equipment_piece_id, :slot_id

  after_save :modify_piece_updated_time

  def modify_piece_updated_time
    self.equipment_piece.updated_at = self.updated_at
    self.equipment_piece.save
  end

end
