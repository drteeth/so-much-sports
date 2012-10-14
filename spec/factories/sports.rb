FactoryGirl.define do
  factory :sport do
    name
    rank

    factory :sport_with_periods do
      ignore do
        periods_count 3
      end

      after(:create) do |sport, evaluator|
        FactoryGirl.create_list(:period_with_games, evaluator.periods_count, sport:sport)
      end
    end
  end
end
