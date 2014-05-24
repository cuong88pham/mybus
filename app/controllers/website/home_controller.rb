class Website::HomeController < ApplicationController
  respond_to :html, :json
  layout 'website'
  def index
    @locations = Location.all
    @posts     = Post.where(show_in_home_page: true).paginate(:page => params[:page], :per_page => 4)

  end

  def post
    @locations = Location.all
    @post = Post.find(params[:id])
  end

  def news
    @posts = Post.all
    @locations = Location.all
  end

  def contact

  end

  def search
    @locations = Location.all
    @from_location = @locations.find{|location| location.id == params[:from_location].to_i}
    @to_location = @locations.find{|location| location.id == params[:to_location].to_i}
    @bus_trips = BusTrip.includes(:location_from, :location_to, :tenant, :bus).where(location_from_id: params[:from_location].to_i, location_to_id: params[:to_location].to_i, started_at: params[:search_from_dt].to_date.beginning_of_day..params[:search_from_dt].to_date.end_of_day)
  end

  def booking
    @booking = nil
  end

end
