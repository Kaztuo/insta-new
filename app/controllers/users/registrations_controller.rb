# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user  
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:full_name, :user_name, :password, :password_confirmation, 
                                 :website, :self_introduction, :email, :phone_number, :gender)
  end
end
