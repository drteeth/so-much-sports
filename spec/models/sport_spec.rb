require 'spec_helper'

describe Sport do

  before (:each) do
    @sport = FactoryGirl.create(:sport)
  end

  it "should have a name" do
    @sport.name = "blah"
    @sport.name.should eq "blah"
  end

  it "should have periods" do
    @sport.periods << FactoryGirl.create(:period)
    @sport.periods << FactoryGirl.create(:period)
    @sport.periods.count.should eq 2
  end

end