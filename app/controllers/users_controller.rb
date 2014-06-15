class UsersController < InheritedResources::Base

  actions :all
  respond_to :html, :json
  assign_params :name, :email, :password, :username, :status, :password_confirmation, :last_sign_in_at, :remember_me, :role_ids

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


end
