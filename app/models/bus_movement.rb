class BusMovement < ActiveRecord::Base

  belongs_to :bus_trip
  has_many :buses
  has_many :tickets
  has_many :bus_services
end
