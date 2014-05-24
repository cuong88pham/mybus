class BusTripsController < InheritedResources::Base
  assign_params :code, :from_station_id, :to_station_id, :desc, :position, :started_at, :duration, :tenant_id, :location_from_id, :location_to_id, :bus_id, :price_ticket
  before_action :prepare_data, only: [:new, :show]
  before_action :authenticate_user!
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
