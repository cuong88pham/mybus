class BusesController < InheritedResources::Base
  assign_params :name, :code, :seats, :has_bed
  before_action :prepare_data, only: [:new, :show]


  private
  def prepare_data
    @drivers   = Driver.all
    @tenants   = Tenant.all
  end

  def collection
    @buses = Bus.all
  end
end
