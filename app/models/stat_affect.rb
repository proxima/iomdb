class StatAffect < ActiveRecord::Base

  acts_as_versioned

  belongs_to :equipment_piece
  has_one :stat

  validates_presence_of :equipment_piece_id, :stat_id, :value
  validates_numericality_of :equipment_piece_id, :stat_id, :value

end
