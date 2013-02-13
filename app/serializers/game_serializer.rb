class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_time, :home_score, :visitor_score, :status, :display_status
  has_one :home_team
  has_one :visitor_team
end
