# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    type ""
    league "MyString"
    status "MyString"
    display_status "MyString"
    url "MyString"
    home_score 1
    visitor_score 1
    channel "MyString"
    reason "MyString"
    game_time "2012-07-29 19:58:54"
    home_team_id 1
    visitor_team_id 1
  end
end
