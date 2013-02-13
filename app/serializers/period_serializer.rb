class PeriodSerializer < ActiveModel::Serializer
  # belongs_to :sport
  has_many :games
  attributes :id, :period_id, :label, :is_default
end
