require 'spec_helper'

describe Period do

  before(:each) do
    @period = FactoryGirl.create(:period)
  end

  it "should have a label" do
    @period.label = "Wed"
    @period.label.should eq "Wed"
  end

  it "should have an id" do
    @period.id = 123
    @period.id.should eq 123
  end

  it "should have an 'is_default' attribute" do
    @period.is_default = true
    @period.is_default.should eq true
  end

end
