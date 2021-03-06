class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order
  def current_order
    session[:shopping_cart] ||= []
  end
  protected
 
  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :address, :phone, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
