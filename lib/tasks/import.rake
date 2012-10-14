require 'importer'

namespace :nbc do

  desc "sync everything"
  task :sync => [:sports, :periods, :games] do
    puts "sync complete."
  end

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

  desc "clear"
  task :clear => :environment do
    puts "clearing data"
    # TODO move this to the importer and test it.
    Sport.destroy_all
    Period.destroy_all
    Game.destroy_all
    Team.destroy_all
  end

end
