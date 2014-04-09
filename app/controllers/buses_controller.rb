class BusesController < InheritedResources::Base
  assign_params :name, :code, :seats

  private
  def collection
    @buses = Bus.all
  end
end
