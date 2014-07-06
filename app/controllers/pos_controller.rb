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

  def return_ticket
    @tickets = Ticket.all
    @tickets = @tickets.where(fullname: params[:name]) if params[:name].present?
    @tickets = @tickets.where(email: params[:email]) if params[:email].present?
    @tickets = @tickets.where(phone: params[:phone]) if params[:phone].present?
    @locations = Location.all
  end

  def booking
    @ticket = Ticket.new
    @trip = BusTrip.includes(:location_from, :location_to, :tenant, :bus).find(params[:id])
    @sale_ticket = Ticket.where(bus_trip_id: params[:id]).pluck(:ticket_sale)
    @sale_ticket = @sale_ticket.join(',').split(',') unless @sale_ticket.blank?
    @title     = "Đặt vé"
  end

  def make_booking
    @ticket = Ticket.create(params.require(:ticket).permit(:tenant_id, :bus_trip_id, :fullname, :phone, :email, :pick_up_at, :status, :ticket_sale))
    UserMailer.ticket_info(@ticket).deliver
  end

end
