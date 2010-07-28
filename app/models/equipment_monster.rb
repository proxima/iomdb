class EquipmentMonster < ActiveRecord::Base

  cattr_reader :per_page
  @@per_page = 30

  acts_as_versioned

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :equipment_pieces, :dependent => :destroy, :order => 'name ASC'

end
