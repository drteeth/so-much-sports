class Period < ActiveRecord::Base
  attr_accessible :is_default, :label
  belongs_to :sport
  has_many :games, :dependent => :destroy
end
