class StationsController < InheritedResources::Base
  assign_params :name, :code, :location_id
  before_filter :prepare_data, only: [:new, :show, :create, :udpate]
  before_action :authenticate_user!

  private
  def prepare_data
    @locations = Location.all
  end

  def collection
    @stations = Station.includes(:location).all
  end
end
