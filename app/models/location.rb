class Location < ActiveRecord::Base
  has_many :routes
  has_many :dialectics, through: :routes
end
