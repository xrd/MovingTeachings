class Stop <ActiveRecord::Base
  belongs_to :routes
  belongs_to :location
  validates_uniqueness_of :name, :scope => [ :zipcode, :location_id, :route_id ]
end
