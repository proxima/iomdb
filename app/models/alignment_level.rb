class AlignmentLevel < ActiveRecord::Base

  validates_presence_of :name, :level
  validates_uniqueness_of :name, :level

  validates_numericality_of :level, :only_integer => true

end
