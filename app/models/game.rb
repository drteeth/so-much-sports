class Game < ActiveRecord::Base
  attr_accessible :channel,
                  :display_status,
                  :game_time,
                  :home_score,
                  :home_team_id,
                  :league,
                  :reason,
                  :status,
                  :game_type,
                  :url,
                  :visitor_score,
                  :visitor_team_id,
                  :home_team,
                  :visitor_team,
                  :period_id

  belongs_to :period
  belongs_to :home_team, :class_name => 'Team'
  belongs_to :visitor_team, :class_name => 'Team'

  validates :home_team_id, :visitor_team_id, :presence => true
end
