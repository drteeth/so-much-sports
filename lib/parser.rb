class Parser

  def order(response)
    json = JSON.parse(response)
    json["sports"].split("|")
  end

  def periods(period_json)
    JSON.parse(period_json)
  end

  def games(games_json)
    json = JSON.parse(games_json)
    games = json["games"] || []
    result = games.map do |g|
      xml = Nokogiri::XML(g)
      game = {}
      game["visiting-team"] = {}
      game["home-team"] = {}

      ticker = xml.css('ticker-entry').first
      game["gamecode"] = ticker["gamecode"]
      game["gametype"] = ticker["gametype"]
      game["league"]   = ticker["league"]

      gamestate = xml.css('gamestate').first
      game["status"]           = gamestate["status"]
      game["href"]             = gamestate["href"]
      game["tv"]               = gamestate["tv"]
      game["reason"]           = gamestate["reason"]
      game["is-dst"]           = gamestate["is-dst"]
      game["gametime"]         = gamestate["gametime"]
      game["gamedate"]         = gamestate["gamedate"]
      game["display_status1"] = gamestate["display_status1"]
      game["display_status2"] = gamestate["display_status2"]

      visiting_team = xml.css('visiting-team').first
      game["visiting-team"]["display_name"] = visiting_team["display_name"]
      game["visiting-team"]["alias"]        = visiting_team["alias"]
      game["visiting-team"]["nickname"]     = visiting_team["nickname"]
      game["visiting-team"]["id"]           = visiting_team["id"]
      game["visiting-team"]["division"]     = visiting_team["division"]
      game["visiting-team"]["league"]       = visiting_team["league"]
      game["visiting-team"]["score"]        = visiting_team["score"]

      home_team = xml.css('home-team').first
      game["home-team"]["display_name"] = home_team["display_name"]
      game["home-team"]["alias"]        = home_team["alias"]
      game["home-team"]["nickname"]     = home_team["nickname"]
      game["home-team"]["id"]           = home_team["id"]
      game["home-team"]["division"]     = home_team["division"]
      game["home-team"]["league"]       = home_team["league"]
      game["home-team"]["score"]        = home_team["score"]

      game
    end

    result
  end

end
