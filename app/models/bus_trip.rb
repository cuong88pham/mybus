class BusTrip < ActiveRecord::Base

  belongs_to :station_from,:class_name => 'Station', :foreign_key => 'from_station_id'
  belongs_to :station_to,:class_name => 'Station', :foreign_key => 'to_station_id'

  belongs_to :tenant

  belongs_to :location_from, class_name: 'Location', foreign_key: :location_from_id, primary_key: :id
  belongs_to :location_to, class_name: 'Location', foreign_key: :location_to_id, primary_key: :id
  belongs_to :bus
  has_many :bus_movements
  before_save :set_bus_trip_name

  # Get active brand
  scope :actived, where(is_valid: true)

  private
  def set_bus_trip_name
    self.name ||= self.station_from.try(:name) + ' - ' + self.station_to.try(:name)
  end
end
