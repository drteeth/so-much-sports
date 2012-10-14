FactoryGirl.define do
  factory :period do
    period_id
    label
    is_default false

    factory :period_with_games do
      ignore do
        games_count 5
      end

      after(:create) do |period, evaluator|
        FactoryGirl.create_list(:game, evaluator.games_count, period:period)
      end
    end
  end
end
