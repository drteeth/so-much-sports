class Sport < ActiveRecord::Base
  attr_accessible :name, :rank
  has_many :periods, :dependent => :destroy
  default_scope :order => :rank
end
