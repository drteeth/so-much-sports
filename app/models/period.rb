class Period < ActiveRecord::Base
  attr_accessible :is_default, :label, :period_id
  belongs_to :sport
  has_many :games, :dependent => :destroy

  def self.for_sport(sport_id)
    where(sport_id:sport_id)
  end

  def self.sport_and_period(sport_name, period_id)
    sport = Sport.find_by_name(sport_name)
    Period.find_by_sport_id_and_period_id(sport.id, period_id, :include => dependents)
  end

  def self.dependents
    [
      :sport,
      :games => [:visitor_team, :home_team]
    ]
  end
end
