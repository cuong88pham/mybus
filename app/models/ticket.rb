class Ticket < ActiveRecord::Base
  belongs_to :bus_trip
  belongs_to :tenant

  attr_protected :id, :tenant_id, :bus_trip_id, :fullname, :phone, :email, :password, :promote_code, :pick_up_at, :status
end
