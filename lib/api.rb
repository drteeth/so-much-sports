require 'open-uri'

class Api

  def order
  	puts "warning: hardcoded order"
  	'callback({ "sports":"NFL|MLB|CFB|NBA|MLS" });'
  end

  def periods(sports)
    # use &random=1350250416940 for a cache buster if needed
    # nfl|mlb|cfb|nba|golf|mls|nascar
    url = "http://scores.nbcsports.msnbc.com/ticker/data/sports.js.asp?order=#{sports}"
    puts url
    open(URI.escape(url)).read
  end

  def games(sport,period)
    url = "http://scores.nbcsports.msnbc.com/ticker/data/gamesMSNBC.js.asp?sport=#{sport}&period=#{period}"
    puts url
    open(url).read
  end

end
