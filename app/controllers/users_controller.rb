class UsersController < InheritedResources::Base
  load_and_authorize_resource
  actions :all
  respond_to :html, :json
  assign_params :name, :email, :password, :username, :status, :password_confirmation, :last_sign_in_at, :remember_me, :role_ids => []
  before_action :check_empty_role_ids

  def update
    update! do |format|
      format.html { redirect_to users_path }
    end
  end

  def create
    create! do |format|
      format.html { redirect_to users_path }
    end
  end

  private
  def check_empty_role_ids
    if params[:user].present? && params[:user][:role_ids].present?
      params[:user][:role_ids].delete("")
    end
  end

end
