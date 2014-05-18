class DriversController < InheritedResources::Base
  assign_params :name, :code, :address, :phone, :driver_type, :tenant_id

  before_action :prepare_form, only: ['new', 'show', 'create', 'update']
  before_action :authenticate_user!

  private

  def prepare_form
    if current_tenant.schema == 'admin'
      @tenants = Tenant.all
    else
      @tenants = nil
    end
  end

  def collection
    if current_tenant.schema == 'admin'
      @drivers = Driver.all
    else
      @drivers = Driver.by_tenant(current_tenant.id)
    end
  end

end
