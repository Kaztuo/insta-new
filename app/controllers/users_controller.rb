class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render 'show'
    else
      render 'new'
    end
  end  

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:full_name, :user_name, :password, :password_confirmation)
  end
end