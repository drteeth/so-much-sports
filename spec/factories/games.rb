FactoryGirl.define do
  factory :game do
    association :home_team, factory: :team
    association :visitor_team, factory: :team
  end
end
