object @sport
attributes :id, :name
child :periods do
  attributes :period_id, :label, :is_default
  child :games do
    attributes :id, :game_time, :home_score, :visitor_score, :status, :display_status
    # node :home_team do |game|
    #   game.home_team.nickname
    # end
    # node :visitor_team do |game|
    #   game.visitor_team.nickname
    # end
    child :home_team => :home_team do
      attributes :id, :nickname, :name, :alias, :shortname, :division, :league
    end
    child :visitor_team => :visitor_team do
      attributes :id, :nickname, :name, :alias, :shortname, :division, :league
    end
  end
end
