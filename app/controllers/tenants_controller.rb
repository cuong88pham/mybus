class TenantsController < InheritedResources::Base
  assign_params :name, :domain, :schema, :address, :email, :phone, :contact_person, :is_valid

  private
  def collection
    @tenants = Tenant.all
  end

end
