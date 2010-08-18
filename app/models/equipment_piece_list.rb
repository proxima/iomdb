class EquipmentPieceList < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :equipment_piece_list_entries, :dependent => :destroy

  belongs_to :admin_user

end
