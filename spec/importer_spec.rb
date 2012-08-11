require 'spec_helper'
require 'importer'

describe Importer do

  before(:each) do
    @importer = Importer.new
    @mock_parser = double("parser")
  end

  describe "sport order" do

    # it "should sync the sport order" do
    #   @importer.sync_sports
    # end

    it "should delete old sports" do
      @sports = FactoryGirl.create_list(:sport, 3)
      @importer.parser = @mock_parser
      @mock_parser.stub(:order).and_return([@sports[2].name])
      @importer.sync_sports
      Sport.count.should eq 1
      Sport.first.name.should eq @sports[2].name
    end

    it "should add new sports" do
      @sports = FactoryGirl.build_list(:sport, 3)
      @importer.parser = @mock_parser
      order = @sports.map { |s| s.name }
      @mock_parser.stub(:order).and_return(order)
      @importer.sync_sports

      Sport.count.should eq 3
    end

    it "should correctly order sports" do
      @sports = FactoryGirl.create_list(:sport, 3)
      @importer.parser = @mock_parser
      order = @sports.map { |s| s.name }.reverse
      @mock_parser.stub(:order).and_return(order)
      @importer.sync_sports

      Sport.all.map { |s| s.name }.should eq order

    end
  end

end