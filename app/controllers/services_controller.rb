class ServicesController < InheritedResources::Base
  assign_params :name, :code

  private
  def collection
    @services = Service.all
  end
end
