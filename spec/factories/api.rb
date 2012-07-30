FactoryGirl.define do

  # i think we need to move these out to normal mock objects.

  sequence :order_jsonp do
    'callback({ "sports":"mlb|mls|golf|nascar" });'
  end

  sequence :periods_json do
    <<-DELIM
    [ {"sport": "MLB","period": [{"period": "20120728", "label": "Sat.", "isdefault": false},{"period": "20120729", "label": "Sun.", "isdefault": true},{"period": "20120730", "label": "Mon.", "isdefault": false}]} ,{"sport": "MLS","period": [{"period": "20120728", "label": "Sat.", "isdefault": false},{"period": "20120729", "label": "Sun.", "isdefault": true},{"period": "20120803", "label": "Fri.", "isdefault": false}]} ,{"sport": "NBA","period": [{"period": "20120729", "label": "Sun.", "isdefault": true},{"period": "20121030", "label": "Tue.", "isdefault": false}]} ,{"sport": "NHL","period": [{"period": "20120729", "label": "Sun.", "isdefault": true},{"period": "20121011", "label": "Thu.", "isdefault": false}]} ,{"sport": "NFL","period": [{"period": "-1", "label": "Preseason Week 1", "isdefault": true},{"period": "-2", "label": "Preseason Week 2", "isdefault": false}]} ,{"sport": "CFB","period": [{"period": "1", "label": "Week 1", "isdefault": true},{"period": "2", "label": "Week 2", "isdefault": false}]} ,{"sport": "CBK","period": [{"period": "20120402", "label": "Mon", "isdefault": false},{"period": "20120729", "label": "Sun", "isdefault": true}]} ,{"sport": "Golf","period": [{"period": "20120038","label": "RBC Canadian Open","isdefault": true}]} ,{"sport": "NASCAR","period": [{"period": "20120729012","label": "Crown Royal Presents The Curtiss Shaver 400 at The Brickyard","isdefault": true}]} ,{"sport": "TOUR","period": [{"period": "20120722", "label": "Sun.", "isdefault": false},{"period": "20120729", "label": "Sun.", "isdefault": true}]} ]
DELIM
  end

  sequence :games_json do
    <<-DELIM
    {
      "sport": "MLB",
      "period": "20120729",
      "games": [
        "<ticker-entry gamecode=\"320729113\" gametype=\"Regular Season\" league=\"AL\"><visiting-team display_name=\"Chi White Sox\" alias=\"CWS\" nickname=\"White Sox\" id=\"4\" division=\"ALC\" league=\"AL\" score=\"0\"><score heading=\"1\" value=\"0\"></score><score heading=\"2\" value=\"0\"></score><score heading=\"R\" value=\"0\"></score><score heading=\"H\" value=\"1\"></score><score heading=\"E\" value=\"0\"></score></visiting-team><home-team display_name=\"Texas\" alias=\"Tex\" nickname=\"Rangers\" id=\"13\" division=\"ALW\" league=\"AL\" score=\"0\"><score heading=\"1\" value=\"0\"></score><score heading=\"2\" value=\"0\"></score><score heading=\"R\" value=\"0\"></score><score heading=\"H\" value=\"3\"></score><score heading=\"E\" value=\"0\"></score></home-team><gamestate status=\"In-Progress\" display_status1=\"Bot\" display_status2=\"2nd\" href=\"http://scores.nbcsports.msnbc.com/mlb/boxscore.asp?gamecode=320729113\" tv=\"CSN/FxSW\" gametime=\"7:05 PM\" gamedate=\"7/29\" is-dst=\"1\" is-world-dst=\"1\" reason=\"\"></gamestate></ticker-entry>"
        ,"<ticker-entry gamecode=\"320729110\" gametype=\"Regular Season\" league=\"AL\"><visiting-team display_name=\"Boston\" alias=\"Bos\" nickname=\"Red Sox\" id=\"2\" division=\"ALE\" league=\"AL\" score=\"\"><score heading=\"R\" value=\"\"></score><score heading=\"H\" value=\"\"></score><score heading=\"E\" value=\"\"></score></visiting-team><home-team display_name=\"NY Yankees\" alias=\"NYY\" nickname=\"Yankees\" id=\"10\" division=\"ALE\" league=\"AL\" score=\"\"><score heading=\"R\" value=\"\"></score><score heading=\"H\" value=\"\"></score><score heading=\"E\" value=\"\"></score></home-team><gamestate status=\"Pre-Game\" display_status1=\"8:05 PM\" display_status2=\"\" href=\"http://scores.nbcsports.msnbc.com/mlb/preview.asp?g=320729110\" tv=\"ESPN\" gametime=\"8:05 PM\" gamedate=\"7/29\" is-dst=\"1\" is-world-dst=\"1\" reason=\"\"></gamestate></ticker-entry>"
    ]}
DELIM
  end

end
