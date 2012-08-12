# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quotes = [
  ["Football is an incredible game. Sometimes it's so incredible, it's unbelievable.", "Tom Landry"],
  ["And Farmer has now scored 19 goals, exactly double the number he scored last season.", "Garry Lyon"],
  ["Baseball is 90% mental. The other half is physical.", "Yogi Berra"],
  ["The Yankees are only interested in one thing, and I don't know what that is.", "Louos Polonia"],
  ["Better teams win more often than the teams that are not so good.", "Tom Watt, ex-Maple Leaves coach"],
  ["Any time Detroit scores more than 100 points and holds the other team below 100 points, they almost always win.", "Doug Collins"],
  ["You guys pair up in groups of three, then line up in a circle.", "Unknown"],
  ["You guys line up alphabetically by height.", "Unknown"],
  ["You can sum up this sport in two words: 'You never know.'", "Lou Duva"],
  ["Well, we now have exactly the same situation as at the beginning of the race, only exactly opposite.", "Murray Walker"],
  ["The lead car is absolutely unique, except for the one behind it which is identical.", "Murray Walker"],
  ["I'd like to play for an Italian club, like Barcelona.", "Mark Draper"],
  ["Without being too harsh on David, he cost us the match.", "Ian Wright"],
  ["Julian Dicks is everywhere. It's like they've got eleven Dicks on the field.", "Metro Radio"],
  ["I'd run over my own mother to win the Super Bowl.", "Joe Jacoby"],
  ["I feel like I'm the best, but you're not going to get me to say that.", "Jerry Rice"],
  ["My career was sputtering until I did a 360 and got headed in the right direction.", "Tracy McGrady"],
  ["I don't think anywhere is there a symbiotic relationship between caddie and player like there is in golf.", "Johnny Miller"],
  ["If you've only got one day to live, come see the Toronto Maple Leafs. It'll seem like forever.", "Pat Foley"],
  ["The drivers have one foot on the brake, one on the clutch, and one on the throttle.", "Bob Varsha"],
  ["I quit school in the sixth grade because of pneumonia. Not because I had it, but because I couldn't spell it.", "Rocky Graziano"],
  ["Cross country skiing is great if you live in a small country.", "Steven Wright"],
  ["The Germans only have one player under 22, and he's 23!", "Kevin Keegan"],
  ["Nobody in football should be called a genius. A genius is a guy like Norman Einstein.", "Joe Theismann"],
  ["I've seen George Foreman shadow boxing and the shadow won.", "Muhammad Ali"],
  ["It's all about the two M's: movement and positioning.", "Ron Atkinson"],
  ["Chile have three options - they could win or they could lose.", "Kevin Keegan"],
  ["Wrestling is ballet with violence.", "Jesse Ventura"],
  ["This is a really a lovely horse, I once rode her mother.", "Ted Walsh"],
  ["Skiing combines outdoor fun with knocking down trees with your face.", "Dave Barry"],
  ["It's just a job. Grass grows, birds fly, waves pound the sand. I beat people up.", "Muhammad Ali"],
  ["Whenever I feel like exercising I lie down until the feeling passes!", "Robert M. Hutchins"]
]

quotes.each { |q| Quote.create(:content => q[0], :author => q[1] || "Unknown" ) }
