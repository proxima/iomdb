class EquipmentPieceListEntry < ActiveRecord::Base

  belongs_to :equipment_piece_list
  has_one :equipment_piece

end
