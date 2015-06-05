class Location < ActiveRecord::Base
  has_many :lists
  has_many :beers, through: :lists

end
