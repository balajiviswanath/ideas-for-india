class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
  layout :layout_by_resource

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :about, :password, :institute_id, :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :about, :password, :institute_id, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end
  
  def layout_by_resource
    
    if devise_controller?
      "login_layout"
    elsif params[:controller] == "staticpages"
      "static_layout"
    else
      "application"
    end
  end
end
