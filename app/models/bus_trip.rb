class BusTrip < ActiveRecord::Base

  belongs_to :station_from,:class_name => 'Station', :foreign_key => 'from_station_id'
  belongs_to :station_to,:class_name => 'Station', :foreign_key => 'to_station_id'

  belongs_to :brand

  has_many :bus_movements
  before_save :set_bus_trip_name

  private
  def set_bus_trip_name
    self.name ||= self.station_from.try(:name) + ' - ' + self.station_to.try(:name)
  end
end
