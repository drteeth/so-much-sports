class SportSerializer < ActiveModel::Serializer
  has_many :periods
  attributes :id, :name
end
