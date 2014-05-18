class LocationsController < InheritedResources::Base
  assign_params :name, :code
  private
  def collection
    @locations = Location.all
  end
end
