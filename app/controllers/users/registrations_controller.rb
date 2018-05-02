# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # This lets you register while logged in
  prepend_before_action :require_no_authentication, only: :cancel

  before_action :redirect_unless_admin

  # GET '/users/sign_up'
  def new
    super
  end

  # POST '/users'
  def create
    super
  end

  # GET '/users/edit'
  def edit
    super
  end

  # PUT '/users'
  def update
     new_params = params.require(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
     change_password = true
     if params[:user][:password].blank?
       params[:user].delete("password")
       params[:user].delete("password_confirmation")
       new_params = params.require(:user).permit(:email, :username)
       change_password = false
     end

     @user = User.find(current_user.id)
     is_valid = false

     if change_password
       is_valid = @user.update_with_password(new_params)
     else
       is_valid = @user.update_without_password(new_params)
     end

     if is_valid
       set_flash_message :notice, :updated
       sign_in @user, :bypass => true
       redirect_to after_update_path_for(@user)
     else
       render "edit"
     end
   end

  # DELETE '/users'
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  # end

  # This stops app from logging you in automatically when registering a new account
  def sign_up(resource_name, resource)
    true
  end

  private

  def registration_params
    params.require(:user).permit(:email, :display_name, :terms_of_services, :profile, :password, :password_confirmation, :first_name, :last_name)
  end

end
