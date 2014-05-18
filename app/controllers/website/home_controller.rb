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
  end

end
