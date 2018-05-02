class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

  def redirect_unless_admin
    unless current_user && current_user.admin == true
      redirect_to root_path, notice: "You do not have permissions to do that!"
    end
  end

end
