require 'open-uri'

class Api

  def order
  	puts "warning: hardcoded order"
  	'callback({ "sports":"nfl|mlb|cfb|nba|mls" });'
  end

  def periods(sports)
    # use &random=1350250416940 for a cache buster if needed
    # nfl|mlb|cfb|nba|golf|mls|nascar
    url = "http://scores.nbcsports.msnbc.com/ticker/data/sports.js.asp?order=#{sports}"
    open(URI.escape(url)).read
  end

  def games(sport,period)
    url = "http://scores.nbcsports.msnbc.com/ticker/data/gamesMSNBC.js.asp?sport=#{sport}&period=#{period}"
    open(url).read
  end

end
