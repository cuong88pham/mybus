class BusMovementsController < InheritedResources::Base
  private
  def collection
    @bus_movements = BusMovement.all
  end
end
