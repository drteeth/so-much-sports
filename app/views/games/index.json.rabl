collection @sports
attributes :id, :name
child :periods do
  attributes :label
  child :games do
    attributes :game_time, :home_score, :visitor_score, :status, :display_status
    child :home_team do
      attributes :nickname
    end
  end
end
