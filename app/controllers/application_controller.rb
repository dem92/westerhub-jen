class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:first_name, :last_name, :username, :company_name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:first_name, :last_name, :username, :about, :skills, :company_name, :email, :password, :current_password, :image, :image_cache, :remove_image)
    end
  end


end
