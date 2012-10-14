class Period < ActiveRecord::Base
  attr_accessible :is_default, :label, :period_id
  belongs_to :sport
  has_many :games, :dependent => :destroy

  def self.for_sport(sport_id)
    where(sport_id:sport_id)
  end
end
