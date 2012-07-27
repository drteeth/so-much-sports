FactoryGirl.define do

  sequence :name do |n|
    "name #{n}"
  end

  sequence :label do |n|
    "label #{n}"
  end

  factory :sport do
    name
  end

  factory :period do
    label
    is_default false
  end

end