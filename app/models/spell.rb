class Spell < ActiveRecord::Base

  cattr_reader :per_page
  @@per_page = 30

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_numericality_of :base_cost, :only_integer => true

end
