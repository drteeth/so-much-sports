# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    type ""
    league "league"
    status "status"
    display_status "display_status"
    url "http://url.org"
    home_score 2
    visitor_score 1
    channel "channel"
    # reason
    game_time "2012-07-29 19:58:54"
    association :home_team, factory: :team
    association :visitor_team, factory: :team
  end
end
