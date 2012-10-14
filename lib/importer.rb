require 'parser'
require 'api'

class Importer
  attr_accessor :parser, :api

  def initialize
    @parser = Parser.new
    @api = Api.new
  end

  def sync_sports
    # get the sports from the server
    server_sport_order = @parser.order(@api.order)

    # delete any sports that we have locally that the server not longer mentions
    sports_to_remove = Sport.names - server_sport_order
    sports_to_remove.each { |name| Sport.find_by_name(name).destroy }

    # update or create each sport in the server's list
    # re-ordering as needed.
    server_sport_order.each_with_index do |name, index|
      sport = Sport.find_or_create_by_name(name)
      sport.update_column(:rank, index + 1)
    end
  end

  def sync_periods
    # get period data for all the sports we have locally
    json = @api.periods Sport.names.join("|")
    period_data = @parser.periods(json)

    puts period_data

    period_data.each do |sport_hash|
      sport = Sport.find_by_name!(sport_hash['sport'])
      periods = sport_hash['period']

      # get all the active period ids
      period_ids = periods.map do |period|
        period['period'] # the id comes to us in the 'period' attr
      end

      # remove old periods
      periods_to_remove = sport.periods - period_ids
      periods_to_remove.each do |id|
        Period.find(id).destroy
      end

      # update or create the periods
      periods.each do |p|
        period = Period.find_or_create_by_sport_id_and_period_id(sport.id, p['period'])
        period.update_attributes({
          :is_default => p['isdefault'],
          :label => p['label'],
        })
      end
    end
  end

  def sync_games
    Period.all.each do |period|
      games_data = @parser.games(@api.games(period.sport.name, period.period_id))

      game_ids_from_server = games_data.map do |game|
        game['gamecode']
      end

      # remove old games
      games_to_remove = period.games.map(&:id) - game_ids_from_server
      games_to_remove.each do |game_id|
        Game.find(game_id).destroy
      end

      # create/update any teams
      teams = games_data.map do |g|
        [g["visiting-team"], g["home-team"]]
      end.flatten

      teams.each do |t|
        id = t['id']
        team = Team.find_or_create_by_id!(id)
        team.update_attributes!({
          :name => t['display_name'],
          :shortname => t['alias'],
          :nickname => t['nickname'],
          :division => t['division'],
          :league => t['league'],
        })
      end

      # add/update games
      games_data.each do |g|
        game_id = g['gamecode']
        attrs = {
          :id => game_id,
          :game_type => g['gametype'],
          :league => g['league'],
          :status => g['status'],
          :url => g['href'],
          :channel => g['tv'],
          :reason => g['reason'],
          # TODO deal with game type
          # :is => g['is-dst'],
          # :game_time => g['gametime'],
          # :gamedate => g['gamedate'],
          :display_status => "#{g['display_status1']} #{g['display_status2']}",
          # TODO change score default to 0
          :home_score => g['home-team']['score'],
          # TODO change score default to 0
          # TODO start collecting running scores?
          :visitor_score => g['visiting-team']['score'],
          :home_team_id => g["home-team"]["id"],
          :visitor_team_id => g["visiting-team"]["id"],
        }
        game = Game.find_by_id(game_id)
        if game.present?
          game.update_attributes! attrs
        else
          game = Game.create! attrs
        end
      end
    end

  end

  def self.sync_sports
    Importer.new.sync_sports
  end

  def self.sync_periods
    Importer.new.sync_periods
  end

  def self.sync_games
    Importer.new.sync_games
  end

end