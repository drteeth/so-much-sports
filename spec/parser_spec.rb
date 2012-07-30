require 'spec_helper'
require 'parser'

describe Parser do

  before(:each) do
    @parser = Parser.new
  end

  describe "sport order" do
    before(:each) do
      @order_data = FactoryGirl.create(:order_jsonp)
    end

    it "should parse the order" do
      parsed = @parser.order(@order)
      # ben thinks this should be a ruby array
      # ['mlb', 'mls', 'golf', 'nascar']
      parsed.should eq '"sports":"mlb|mls|golf|nascar"'
    end

  end
end