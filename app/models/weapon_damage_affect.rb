class WeaponDamageAffect < ActiveRecord::Base

  has_one :damage_type
  has_one :weapon_damage_level

  belongs_to :equipment_piece

  validates_presence_of :equipment_piece_id, :weapon_damage_level_id, :damage_type_id
  validates_numericality_of :equipment_piece_id, :weapon_damage_level_id, :damage_type_id

  after_save :modify_piece_updated_time

  def modify_piece_updated_time
    self.equipment_piece.updated_at = self.updated_at
    self.equipment_piece.save
  end

end
