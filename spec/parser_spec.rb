require 'spec_helper'
require 'parser'

describe Parser do

  before(:each) do
    @parser = Parser.new
  end

  it "should parse the order" do
    parsed = @parser.order(ApiFactory.order_jsonp)
    parsed.should eq %w(mlb mls golf nascar)
  end

  it "should parse the periods" do
    parsed = @parser.periods(ApiFactory.periods_json)
    parsed[0]["sport"].should eq "MLB"
    parsed[1]["sport"].should eq "MLS"
    periods = parsed[1]["period"]
    periods[0]["period"].should eq "20120728"
    periods[1]["isdefault"].should be_true
    parsed[1]["period"][2]["label"].should eq "Fri."
  end

  describe "games" do
    before(:each) do
      @parsed = @parser.games(ApiFactory.games_json)
      @game = @parsed[0]
    end

    it "should have two games" do
      @parsed.length.should eq 2
    end

    it "should have a game code" do
      @game["gamecode"].should eq "320729113"
    end

    it "should have a tv" do
      @game["tv"].should eq "CSN/FxSW"
    end

    it "should have a display status 1" do
      @game["display_status1"].should eq "Bot"
    end

    it "should have a display status 2" do
      @game["display_status2"].should eq "2nd"
    end

    it "should have a game time" do
      @game["gametime"].should eq "7:05 PM"
    end

    it "should have a game_date" do
      @game["gamedate"].should eq "7/29"
    end

    it "should have a DST" do
      @game["is-dst"].should eq "1"
    end

    it "should have a league" do
      @game["league"].should eq "AL"
    end

    it "should have a reason" do
      @game["reason"].should eq ""
    end

    it "should have a status" do
      @game["status"].should eq "In-Progress"
    end

    it "should have a type" do
      @game["gametype"].should eq "Regular Season"
    end

    it "should have a url" do
      @game["href"].should eq "http://scores.nbcsports.msnbc.com/mlb/boxscore.asp?gamecode=320729113"
    end

    describe "Teams" do

      before(:each) do
        @home = @game["home-team"]
        @visiting = @game["visiting-team"]
      end

      it "should have a visitor_score" do
        @visiting["score"].should eq "0"
      end

      it "should have a visitor_team_id" do
        @visiting["id"].should eq "4"
      end

      it "should have a alias" do
        @visiting["alias"].should eq "CWS"
      end

      it "should have a nickname" do
        @visiting["nickname"].should eq "White Sox"
      end

      it "should have a division" do
        @visiting["division"].should eq "ALC"
      end

      it "should have a league" do
        @visiting["league"].should eq "AL"
      end

      it "should have a home_score" do
        @home["score"].should eq "0"
      end

      it "should have a home_team_id" do
        @home["id"].should eq "13"
      end

      it "should have a alias" do
        @home["alias"].should eq "Tex"
      end

      it "should have a nickname" do
        @home["nickname"].should eq "Rangers"
      end

      it "should have a division" do
        @home["division"].should eq "ALW"
      end

      it "should have a league" do
        @home["league"].should eq "AL"
      end
    end
  end
end
