require 'spec_helper'

describe Game do

  before(:each) do
    @game = FactoryGirl.create(:game)
  end

  it "should have a type" do
    @game.type = "type"
    @game.type.should eq "type"
  end

  it "should have a league" do
    @game.league = "league"
    @game.league.should eq "league"
  end

  it "should have a status" do
    @game.status = "status"
    @game.status.should eq "status"
  end

  it "should have a display_status" do
    @game.display_status = "display_status"
    @game.display_status.should eq "display_status"
  end

  it "should have a url" do
    @game.url = "url"
    @game.url.should eq "url"
  end

  it "should have a home_score" do
    @game.home_score = 3
    @game.home_score.should eq 3
  end

  it "should have a visitor_score" do
    @game.visitor_score = 2
    @game.visitor_score.should eq 2
  end

  it "should have a channel" do
    @game.channel = "channel"
    @game.channel.should eq "channel"
  end

  it "should have a reason" do
    @game.reason = "reason"
    @game.reason.should eq "reason"
  end

  it "should have a game_time" do
    now = Time.now
    @game.game_time = now
    @game.game_time.should eq now
  end

  it "should have a home_team_id" do
    @game.home_team_id = 123
    @game.home_team_id.should eq 123
  end

  it "should have a visitor_team_id" do
    @game.visitor_team_id = 4
    @game.visitor_team_id.should eq 4
  end

  it "should have a home team" do
    @game.home_team.should be_a Team
  end

  it "should have a visitor team" do
    @game.visitor_team.should be_a Team
  end

end
