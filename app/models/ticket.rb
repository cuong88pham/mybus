class Ticket < ActiveRecord::Base
  belongs_to :bus_movement
end
