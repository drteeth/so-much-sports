class Sport < ActiveRecord::Base
  attr_accessible :name, :rank
  has_many :periods, :dependent => :destroy
  default_scope :order => :rank

  def self.names
    all.map(&:name)
  end

end
