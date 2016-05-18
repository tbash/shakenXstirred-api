class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      user_keys = [:name, :avatar]
      devise_parameter_sanitizer.permit(:sign_up, keys: user_keys)
      devise_parameter_sanitizer.permit(:account_update, keys: user_keys)
    end
end
