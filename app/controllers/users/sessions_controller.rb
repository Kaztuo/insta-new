# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :authenticate_user!
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   @user = User.new
  # end

  # POST /resource/sign_in
  # def create
  #   @user = User.new(user_permitted_params)
  #   if @user.save 
  #     log_in(@user)
  #     redirect_to @user  
  #   else
  #     render 'new'
  #   end
  # end  
  
  # private
  # def user_permitted_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password])
  # end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
