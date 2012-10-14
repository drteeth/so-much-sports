FactoryGirl.define do

  sequence :name do |n|
    "name #{n}"
  end

  sequence :label do |n|
    "label #{n}"
  end

  sequence :rank do |n|
    n
  end

  sequence :period_id do |n|
    n.to_s
  end

end
