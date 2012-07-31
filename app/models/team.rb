class Team < ActiveRecord::Base
  attr_accessible :shortname, :division, :league, :name, :nickname
  has_many :games
end
