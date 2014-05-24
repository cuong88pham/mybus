class TicketsController < InheritedResources::Base
  assign_params :id, :tenant_id, :bus_trip_id, :fullname, :phone, :email, :password, :promote_code, :pick_up_at, :status

  def collection
    @tickets =  Ticket.all
  end
end