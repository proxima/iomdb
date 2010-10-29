class SpellTrainSpec < ActiveRecord::Base

  def initialize(params = nil)
    super(params)
    self.max = 100 unless self.max
  end

  belongs_to :guild
  has_one :spell

  validates_numericality_of :guild_id, :spell_id, :level, :only_integer => true
  validates_numericality_of :max, :only_integer => true, :maximum => 100, :minimum => 5

end
