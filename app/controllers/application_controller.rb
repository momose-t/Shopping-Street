class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
  	if resource_class == Owner
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :nickname, :email])
    elsif resource_class == Customer
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email])
    else
    	super
    end
  end
end