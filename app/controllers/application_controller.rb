class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :age_id, :sex_id, :status_id, :favorite_title_id, :profile, :phone_number, :icon_id])
  end
end
