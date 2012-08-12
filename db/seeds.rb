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
  ["Whenever I feel like exercising I lie down until the feeling passes!", "Robert M. Hutchins"],
  ["We can't win at home. We can't win on the road. As general manager, I just can't figure out where else to play.", "Pat Williams"],
  ["I want your heart. I want to eat your children.", "Mike Tyson"],
  ["I don't think there's anybody in this organization not focused on the 49ers...I mean Chargers.", "Bill Belichick"],
  ["If the NBA were on channel 5 and a bunch of frogs making love was on channel 4, I'd watch the frogs even if they were coming in fuzzy.", "Bobby Knight"],
  ["He's a guy who gets up at six o'clock in the morning regardless of what time it is.", "Lou Duva"],
  ["When you get that nice celebration coming into the dugout and you're getting your ass hammered by guys - there's no better feeling than to have that done.", "Matt Stairs"],
  ["Every time that I have ever tried to help a woman out, I have been incarcerated.", "Jose Canseco"],
  ["Don't say I don't get along with my teammates. I just don't get along with some of the guys on the team.", "Terrell Owens"],
  ["The offensive linemen are the biggest guys on the field, they're bigger than everybody else, and that's what makes them the biggest guys on the field.", "John Madden"],
  ["I don't want to shoot my mouth in my foot, but those are games we can win.", "Sherman Douglas"],
  ["Basketball is the second most exciting indoor sport, and the other one shouldn't have spectators.", "Dick Vertleib"],
  ["Left hand, right hand, it doesn't matter. I'm amphibious.", "Charles Shackleford"],
  ["I owe a lot to my parents, especially my mother and father", "Greg Norman"],
  ["The NFL, like life, is full of idiots.", "Randy Cross"],
  ["The future ain't what it use to be.", "Yogi Berra"]
]

quotes.each { |q| Quote.create(:content => q[0], :author => q[1] || "Unknown" ) }
