FactoryGirl.define do

  sequence :name do |n|
    "name #{n}"
  end

  sequence :label do |n|
    "label #{n}"
  end

end
