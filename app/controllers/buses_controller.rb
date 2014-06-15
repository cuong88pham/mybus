class BusesController < InheritedResources::Base
  assign_params :name, :code, :seats, :has_bed, :tenant_id, :bus_drivers_attributes

  before_action :prepare_data, only: [:new, :show]
  before_action :authenticate_user!

  def new
    @bus = Bus.new
    @bus_driver = BusDriver.new
    @bus.bus_drivers << @bus_driver
    new!
  end

  def show
    @bus_trips = BusTrip.includes(:driver).where(bus_id: resource.id)
    @bus_id = resource.id
    show!
  end
  private
  def prepare_data
    if current_tenant.schema == 'admin'
      @drivers   = Driver.all
      @tenants   = Tenant.all
    else
      @drivers   = Driver.by_tenant(current_tenant.id)
      @tenants   = nil
    end
    @bustrip = BusTrip.new
    @stations = Station.all
    @brands   = Tenant.all
    @buses    = Bus.all
  end

  def collection
    if current_tenant.schema == 'admin'
      @buses = Bus.all
    else
      @buses = Bus.by_tenant(current_tenant.id)
    end
  end
end
