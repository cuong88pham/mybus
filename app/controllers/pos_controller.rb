class PosController < InheritedResources::Base

  def index
    @locations = Location.all
    @show_result = false
    if params[:from_location].present? && params[:to_location].present?
      @show_result = true
      @bus_trips = BusTrip.by_tenant(current_tenant.id).includes(:location_from, :location_to, :tenant, :bus).where(location_from_id: params[:from_location].to_i, location_to_id: params[:to_location].to_i, started_at: params[:search_from_dt].to_date.beginning_of_day..params[:search_from_dt].to_date.end_of_day)

      @from_location = @locations.find(params[:from_location])
      @to_location = @locations.find(params[:to_location])
    end
  end

  def booking

  end

end
