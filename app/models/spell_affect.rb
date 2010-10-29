class SpellAffect < ActiveRecord::Base

  belongs_to :equipment_piece
  has_one :spell

  validates_presence_of :equipment_piece_id, :spell_id, :value
  validates_numericality_of :equipment_piece_id, :spell_id, :value

  after_save :modify_piece_updated_time

  def modify_piece_updated_time
    self.equipment_piece.updated_at = self.updated_at
    self.equipment_piece.save
  end

end
