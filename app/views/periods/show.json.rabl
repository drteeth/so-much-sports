object @period
attributes :period_id, :label, :is_default

node :sport_id do |period|
  period.sport.id
end

node :games do |period|
  period.games.map do |game|
    partial("games/show", :object => game)
  end
end