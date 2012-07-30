class Team < ActiveRecord::Base
  attr_accessible :shortname, :division, :league, :name, :nickname
end
