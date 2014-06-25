class ReportsController < ApplicationController
  respond_to :html, :xls


  # GET /reports
  # GET /reports.json
  def index
    @locations = Location.all
    @from_location = @locations.find{|location| location.id == params[:from_location].to_i}
    @to_location = @locations.find{|location| location.id == params[:to_location].to_i}
    if params[:act] == 'ticket'
      @tickets =  Ticket.joins(:bus_trip).all
      if params[:search_from_dt].present? || params[:search_to_dt].present?
        @tickets =  @tickets.where("tickets.created_at >= ? AND tickets.created_at <= ?",params[:search_from_dt].to_date, params[:search_to_dt].to_date)
      elsif params[:from_location].present?
        @tickets = @tickets.where("bus_trips.from_station_id = ? ", params[:from_location])
      elsif params[:to_location].present?
        @tickets = @tickets.where("bus_trips.to_station_id = ?", params[:to_location])
      end
    elsif params[:act] == 'customer'
      @tickets =  Ticket.includes(:bus_trip).all
      if params[:search_from_dt].present? || params[:search_to_dt].present?
        @tickets =  @tickets.where("created_at >= ? AND created_at <= ?",params[:search_from_dt].to_date, params[:search_to_dt].to_date)
      elsif params[:from_location].present?
        @tickets = @tickets.where("bus_trips.from_station_id = ? AND bus_trips.to_to_station_id = ?", params[:from_location], params[:to_location])
      end
    end
  end
end
