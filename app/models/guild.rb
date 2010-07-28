class Guild < ActiveRecord::Base

  acts_as_versioned

  cattr_reader :per_page
  @@per_page = 30

  has_one :guild_type

  has_many :skill_train_specs, :order => 'level ASC', :dependent => :destroy
  has_many :spell_train_specs, :order => 'level ASC', :dependent => :destroy

  validates_presence_of :name, :location, :guild_type_id, :levels
  validates_uniqueness_of :name

  validates_numericality_of :levels, :only_integer => true

end
