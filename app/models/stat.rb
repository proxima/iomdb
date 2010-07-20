class Stat < ActiveRecord::Base

  acts_as_versioned

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :abbreviation
  validates_uniqueness_of :abbreviation

end
