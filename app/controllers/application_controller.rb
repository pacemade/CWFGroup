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

  def convert_birthday
    trip = @params[:trip]
    @birthday = Date.new trip["birthday(1i)"].to_i, trip["birthday(2i)"].to_i, trip["birthday(3i)"].to_i
  end

  def age(birthday)
    now = Time.now.utc.to_date
    now.year - @birthday.year - ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
  end

end
