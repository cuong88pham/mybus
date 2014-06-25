class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_tenant
  before_action :authenticate!
  before_action :set_tenant,:set_locate

  # Static function set permit strong params
  def self.assign_params(*permitted_params)
    define_method :resource_params do
      return [] if request.get?
      if defined?(resource_request_name)
        [ params.require(resource_request_name).permit(permitted_params) ]
      else
        [ params.require(controller_name.singularize).permit(permitted_params) ]
      end
    end
  end

  def authenticate!
    if request.subdomain.present? && Apartment::Database.current_tenant != "" && request.subdomain != 'www'
      authenticate_user!
      if controller_name == 'home'
        redirect_to dashboards_path
      end
    end
  end

  def current_tenant
    Rails.application.config.action_mailer.default_url_options = request.host
    @current_tenant ||= Tenant.where(schema: request.subdomain).first
  end

  def set_tenant
    schema = Apartment.default_schema
    if current_tenant.present?
      schema = session[:schema] = current_tenant.schema
      session[:tenant_id] = current_tenant.id
    else
      session[:schema] = schema
    end

    set_current_user if authenticate!
  end

  def set_locate
    # I18n.locale = params[:locale] || cookies[:locale] || I18n.default_locale
  end

  def set_current_user
    # User.current = current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
