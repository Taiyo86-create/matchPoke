class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :basic_auth


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :age_id, :sex_id, :status_id, :favorite_title_id, :profile, :phone_number, :icon_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'Taiyo' && password == 'hogeFuga'
    end
  end
end
