class Stop <ActiveRecord::Base
  belongs_to :routes
  belongs_to :location
end
