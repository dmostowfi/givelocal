class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[store_name address
                                               phone_number])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[store_name address
                                               phone_number])
  end
end
