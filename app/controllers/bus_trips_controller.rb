class BusTripsController < InheritedResources::Base

  assign_params :code, :from_station_id, :to_station_id, :desc, :position, :started_at, :duration, :tenant_id, :location_from_id, :location_to_id, :bus_id, :price_ticket, :sub_seats, :driver_id, :name

  before_action :prepare_data, only: [:new, :create, :update, :show]
  before_action :authenticate_user!

  def create
    super do |format|
      format.html { redirect_to bus_path(resource.bus_id,act: 'movement_history') }
    end
  end

  def update
    update! do |format|
      format.html { redirect_to bus_path(resource.bus_id,act: 'movement_history') }
    end
  end


  private
  def prepare_data
    @stations = Station.all
    @brands   = Tenant.all
    @buses    = Bus.all
    if current_tenant.schema == 'admin'
      @drivers   = Driver.all
      @buses    = Bus.all
    else
      @drivers   = Driver.by_tenant(current_tenant.id)
      @buses    = Bus.by_tenant(current_tenant.id)
    end
  end

  def collection
    @bus_trips = BusTrip.all
  end
end
