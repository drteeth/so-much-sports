require 'open-uri'

class Api

  def order
  	# 'callback({ "sports":"NFL|MLB|CFB|NBA|MLS" });'
    url = "http://dev.rotoworld.com/services/mobile.asmx/GetJSONPScoreboardSportList?callback="
    open(URI.escape(url)).read
  end

  def periods(sports)
    # use &random=1350250416940 for a cache buster if needed
    # nfl|mlb|cfb|nba|golf|mls|nascar
    url = "http://scores.nbcsports.msnbc.com/ticker/data/sports.js.asp?order=#{sports}"
    open(URI.escape(url)).read
  end

  def games(sport,period)
    url = "http://scores.nbcsports.msnbc.com/ticker/data/gamesMSNBC.js.asp?sport=#{sport}&period=#{period}"
    begin
      open(URI.escape(url)).read
    rescue
      puts "*** failed to open #{url} ***"
      '{}'
    end
  end

end
