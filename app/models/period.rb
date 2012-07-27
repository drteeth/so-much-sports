class Period < ActiveRecord::Base
  attr_accessible :is_default, :label
  belongs_to :sport
end
