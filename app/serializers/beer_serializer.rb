class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :brewery, :style, :abv, :locations
end
