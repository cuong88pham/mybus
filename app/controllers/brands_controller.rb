class BrandsController < InheritedResources::Base

  assign_params :name, :code
  private
  def collection
    @brands = Brand.all
  end

end
