class BusTrip < ActiveRecord::Base
  belongs_to :station
  belongs_to :brand

  has_many :bus_movements
end
