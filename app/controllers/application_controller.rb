class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company_name])
  end

  def after_sign_out_path_for(user)
    root_path
  end

  def after_sign_in_path_for(user)
    'pages/dashboard'
  end

end
