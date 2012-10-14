require 'importer'

namespace :nbc do

  desc "import sport order"
  task :sports => :environment do
    puts "fetching order..."
    Importer.sync_sports
    puts Sport.all.map(&:name)
  end

  desc "import period data"
  task :periods => :environment do
    puts "feching period data..."
    Importer.sync_periods
    puts Period.all.map(&:period_id)
  end

  desc "import game data"
  task :games => :environment do
    puts "fetching game data"
    Importer.sync_games
    puts Game.all.map(&:id)
  end

end
