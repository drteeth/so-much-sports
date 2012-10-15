object @game
attributes :id, :game_time, :home_score, :visitor_score, :status, :display_status

node :home_team do |game|
  partial 'teams/show', object:game.home_team
end

node :visitor_team do |game|
  partial 'teams/show', object:game.visitor_team
end
