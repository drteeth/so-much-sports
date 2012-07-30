class Game < ActiveRecord::Base
  attr_accessible :channel, :display_status, :game_time, :home_score, :home_team_id, :league, :reason, :status, :type, :url, :visitor_score, :visitor_team_id
end
