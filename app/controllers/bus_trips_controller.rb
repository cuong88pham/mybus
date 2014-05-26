class BusTripsController < InheritedResources::Base

  assign_params :code, :from_station_id, :to_station_id, :desc, :position, :started_at, :duration, :tenant_id, :location_from_id, :location_to_id, :bus_id, :price_ticket, :sub_seats

  before_action :prepare_data, only: [:new, :create, :update, :show]
  before_action :authenticate_user!

  def create
    binding.pry
    create!
  end

  private
  def prepare_data
    @stations = Station.all
    @brands   = Tenant.all
    @buses    = Bus.all
  end

  def collection
    @bus_trips = BusTrip.all
  end
end
