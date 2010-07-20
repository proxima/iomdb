class DamageType < ActiveRecord::Base

  acts_as_versioned

  validates_presence_of :name
  validates_uniqueness_of :name
  
end
