class StationsController < InheritedResources::Base
  assign_params :name, :code, :location_id, :tenant_id
  before_filter :prepare_data, only: [:new, :show, :create, :udpate]
  before_action :authenticate_user!

  private
  def prepare_data
    if current_tenant.schema == 'admin'
      @tenants = Tenant.all
    else
      @tenants = nil
    end
    @locations = Location.all
  end

  def collection
    if current_tenant.schema == 'admin'
      @stations = Station.includes(:location).all
    else
      @stations = Station.by_tenant(current_tenant.id).includes(:location)
    end
  end
end
