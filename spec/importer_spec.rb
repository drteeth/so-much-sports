require 'spec_helper'
require 'importer'

describe Importer do

  before(:each) do
    @importer = Importer.new
    @mock_parser = double("parser")
  end

  describe "sport order" do

    it "should use the API" do
      @importer.parser = @mock_parser
      @importer.api = double("api")
      @importer.api.should_receive(:order).and_return('')
      @importer.parser.should_receive(:order).with('').and_return([])
      @importer.sync_sports
    end

    it "should delete old sports" do
      # start with some sports
      @sports = FactoryGirl.create_list(:sport, 3)

      # return only the last sport
      @importer.parser = @mock_parser
      @mock_parser.stub(:order).and_return([@sports[2].name])

      # do the sync
      @importer.sync_sports

      # we expect to only have that last sport in the db now
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
      Sport.names.should eq order
    end

    it "should correctly order sports" do
      @sports = FactoryGirl.create_list(:sport, 3)
      @importer.parser = @mock_parser
      order = @sports.map { |s| s.name }.reverse
      @mock_parser.stub(:order).and_return(order)
      @importer.sync_sports

      Sport.all.map { |s| s.name }.should eq order
    end

    it "should ignore non-team sports" do
      # golf, nascar, cycling, etc
    end

  end

  describe "periods" do

    it "should delete old periods" do
      # start with some periods in the database
      @sport = FactoryGirl.create(:sport)
      @periods = FactoryGirl.create_list(:period, 3, sport:@sport)

      # mock a response where there is only 1 period after the sync
      @importer.parser = @mock_parser

      period = @periods[2]
      @mock_parser.stub(:periods).and_return([{
        "sport" => @sport.name,
        "period" => [{"period" => period.period_id}]
      }])

      # do the sync
      @importer.sync_periods

      # we should have only 1 period now
      Period.count.should eq 1
      Period.first.period_id.should eq period.period_id
    end

    describe "adding periods" do

      before(:each) do
        # start with some sports
        sports = [
          @mlb = FactoryGirl.create(:sport, name:'MLB'),
          @mls = FactoryGirl.create(:sport, name:'MLS'),
        ]

        api = double("api")
        api.stub(:periods).and_return(ApiFactory.periods_json)
        @importer.api = api

        # do the sync
        @importer.sync_periods
      end

      it "should add new periods" do
        # we should have 6 new periods
        Period.count.should eq 6
      end

      it "should reference the sports" do
        Period.all.map(&:sport_id).should eq [@mlb.id,@mlb.id,@mlb.id,@mls.id,@mls.id,@mls.id]
      end

    end

    it "should add periods for multiple sports across multiple calls" do
      # create the first sport
      mlb = FactoryGirl.create(:sport, name:'mlb')

      # respond with a period for this sport
      @importer.parser = @mock_parser
      @mock_parser.stub(:periods).and_return([{
        "sport" => mlb.name,
        "period" => [{"period" => '123'}]
      }])

      # sync once
      @importer.sync_periods
      Period.first.period_id.should eq '123'
      Period.count.should eq 1

      # add another sport

      mls = FactoryGirl.create(:sport, name:'mls')
      @mock_parser.stub(:periods).and_return([{
        "sport" => mls.name,
        "period" => [{"period" => '456'}]
      }])

      # sync again
      @importer.sync_periods
      Period.last.period_id.should eq '456'
      Period.count.should eq 2
    end

  end

  describe "games" do

    before(:each) do
      # start with a sport, a period and some games
      sport = FactoryGirl.create(:sport, name:'MLB')
      @period = FactoryGirl.create(:period, sport:sport, period_id:'20120729')

      # setup our mock api
      api = double("api")
      api.stub(:games).and_return(ApiFactory.games_json)
      @importer.api = api
    end

    it "should delete old games" do
      # start with some old games
      games = FactoryGirl.create_list(:game, 3, period:@period)

      # add 2 more games that shouldn't be deleted
      games = [FactoryGirl.create(:game, id:320729110),
               FactoryGirl.create(:game, id:320729113)]

      # do the sync
      @importer.sync_games

      # we should have only 2 games at this point
      Game.count.should eq 2
      Game.first.should eq games.first
      Game.last.should eq games.last
    end

    it "should add new games" do
      # do the sync
      @importer.sync_games

      # we should have 2 games at this point
      Game.count.should eq 2
    end

    it "should create teams" do
      # do the sync
      @importer.sync_games

      # there are 2 games, totalling 4 teams in the factory data
      Team.count.should eq 4
    end

    it "should update teams" do
      # start with a team that will be updated
      FactoryGirl.create(:team, id:4, nickname:"Brown Sox")

      @importer.sync_games

      # Brown Sox should now be White Sox
      Team.find(4).nickname.should eq "White Sox"
    end

  end

end