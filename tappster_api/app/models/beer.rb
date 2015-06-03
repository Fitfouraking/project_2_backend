class Beer < ActiveRecord::Base
  has_many :lists
  has_many :locations, through: :lists
end
