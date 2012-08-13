require 'parser'
require 'api'

class Importer
  attr_accessor :parser, :api

  def initialize
    @parser = Parser.new
    @api = Api.new
  end

  def sync_sports
    parser_order = @parser.order(@api.order)
    db_order = Sport.all.map { |s| s.name }
    remove = db_order - parser_order
    remove.each { |name| Sport.find_by_name(name).destroy }

    parser_order.each_with_index do |name, index|
      sport = Sport.find_or_create_by_name(name)
      sport.update_column(:rank, index + 1)
    end
  end

  def sync_periods
    sports = Sport.all.map{|s| s.name}.join("|")
    period_data = @parser.periods(@api.periods(sports))

    
  end

end