class Website::HomeController < ApplicationController
  respond_to :html, :json
  layout 'website'
  def index
    @locations = Location.all
  end

  def search
    @locations = Location.all
    @from_location = @locations.find{|location| location.id == params[:from_location].to_i}
    @to_location = @locations.find{|location| location.id == params[:to_location].to_i}
  end

end
