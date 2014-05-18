class BrandsController < InheritedResources::Base
  assign_params :name, :code
  before_action :authenticate_user!

  private
  def collection
    @brands = Brand.all
  end

end
