class Location < ActiveRecord::Base
  has_many :routes
  has_many :dialectics, through: :routes
  validates_uniqueness_of :name
end
