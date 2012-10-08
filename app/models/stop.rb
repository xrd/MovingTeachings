class Stop <ActiveRecord::Base
  belongs_to :route_information
  belongs_to :location
end
