class BusMovementsController < InheritedResources::Base
  assign_params :code, :bus_trip_id, :started_at, :can_book_before, :bus_id, :time_started_at
  before_action :prepare_data, only: [:new, :show]
  private

  def prepare_data
    @bus_trips = BusTrip.actived
    @buses     = Bus.all
    @drivers   = Driver.all
  end

  def collection
    @bus_movements = BusMovement.all
  end
end
