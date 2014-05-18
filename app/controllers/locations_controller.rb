class LocationsController < InheritedResources::Base
  assign_params :name, :code
  before_action :authenticate_user!
  private
  def collection
    @locations = Location.all
  end
end
