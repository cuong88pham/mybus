class BusTripsController < InheritedResources::Base
  assign_params :code, :from_station_id, :to_station_id, :desc, :position, :started_at, :duration, :brand_id
  before_action :prepare_data, only: [:new, :show]

  private

  def prepare_data
    @stations = Station.actived
    @brands   = Brand.actived
  end

  def collection
    @bus_trips = BusTrip.all
  end
end
