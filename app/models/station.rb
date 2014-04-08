class Station < ActiveRecord::Base

  has_many :bus_trips_from,:class_name => 'Station', :foreign_key => 'from_station_id'
  has_many :bus_trips_to,:class_name => 'Station', :foreign_key => 'to_station_id'

end
