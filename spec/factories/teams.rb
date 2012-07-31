# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team, aliases: [:home_team, :visitor_team] do
    name "TeamName"
    shortname "SHR"
    nickname "Nickname"
    division "DIV"
    league "LEAG"
  end
end
