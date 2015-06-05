class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :beers
end
