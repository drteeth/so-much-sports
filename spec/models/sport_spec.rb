require 'spec_helper'

describe Sport do

  before (:each) do
    @sport = FactoryGirl.create(:sport)
    2.times do
      @sport.periods << FactoryGirl.create(:period)
    end
  end

  it "should have a name" do
    @sport.name = "blah"
    @sport.name.should eq "blah"
  end

  it "should have periods" do
    @sport.periods.count.should eq 2
  end

  it "should destroy its periods when destroyed" do
    @sport.destroy
    Period.count.should eq 0
  end

  it "should have a rank" do
    @sport.rank = 1
    @sport.rank.should eq 1
  end

  it "should load the sports in order" do
    @sport.rank = 1
    @sport.save

    # add 2 more sports out of order
    FactoryGirl.create(:sport, rank:5)
    FactoryGirl.create(:sport, rank:4)

    # check it
    Sport.all.map { |s| s.rank }.should eq [1,4,5]
  end

end