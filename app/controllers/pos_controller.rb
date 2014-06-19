class PosController < InheritedResources::Base

  def index
    @locations = Location.all
    @show_result = false
    if params[:from_location].present? && params[:to_location].present?
      @show_result = true
      @buses = Bus.by_tenant(current_tenant.id).joins(:bus_trips).where("bus_trips.location_from_id = ? AND bus_trips.location_to_id = ? AND bus_trips.started_at between ? AND ?", params[:from_location].to_i, params[:to_location].to_i, params[:search_from_dt].to_date.beginning_of_day, params[:search_from_dt].to_date.end_of_day)

      @from_location = @locations.find(params[:from_location])
      @to_location = @locations.find(params[:to_location])
    end
  end

  def booking

  end

end
