class StationsController < InheritedResources::Base
  assign_params :name, :code

  private
  def collection
    @stations = Station.all
  end
end
