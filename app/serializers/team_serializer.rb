class TeamSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :name, :shortname, :division, :league

end
