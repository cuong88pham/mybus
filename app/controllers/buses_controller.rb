class BusesController < InheritedResources::Base
  assign_params :name, :code, :seats, :has_bed

  private
  def collection
    @buses = Bus.all
  end
end
