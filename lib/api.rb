class Api

  def order
  end

  def periods(sports)
    # use &random=1350250416940 for a cache buster if needed
    # nfl|mlb|cfb|nba|golf|mls|nascar
    url = "http://scores.nbcsports.msnbc.com/ticker/data/sports.js.asp?order=#{order}"
  end

  def games(sport,period)
    url = "http://scores.nbcsports.msnbc.com/ticker/data/gamesMSNBC.js.asp?sport=#{sport}&period=#{period}"
  end

end
