class DriversController < InheritedResources::Base
  assign_params :name, :code, :address, :phone, :driver_type

  private
  def collection
    @drivers = Driver.all
  end
end
