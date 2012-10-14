namespace :nbc do

  desc "import sport order"
  task :sports => :environment do
    puts "fetching order..."
    Importer.new.sync_sports
  end

  desc "import period data"
  task :periods => :environment do
    puts "feching period data..."
    Importer.new.sync_periods
  end

  desc "import game data"
  task :games => :environment do
    puts "fetching game data"
    Importer.new.sync_games
  end

end
