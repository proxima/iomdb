class StatAffect < ActiveRecord::Base

  belongs_to :equipment_piece
  has_one :stat

  validates_presence_of :equipment_piece_id, :stat_id, :value
  validates_numericality_of :equipment_piece_id, :stat_id, :value

  after_save :modify_piece_updated_time

  def modify_piece_updated_time
    self.equipment_piece.updated_at = self.updated_at
    self.equipment_piece.save
  end

end
