class ServicesController < InheritedResources::Base
  assign_params :name, :code
  before_action :authenticate_user!
  private
  def collection
    @services = Service.all
  end
end
