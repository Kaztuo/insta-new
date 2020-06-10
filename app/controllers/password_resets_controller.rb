class PasswordResetsController < ApplicationController
  before_action :get_user,    only: [:edit, :update]
  
  def new
  end

  def edit
  end
  
  def create
  end
  
  
def update
    if @user.authenticate("#{params[:password_exist]}") && params[:password] == params[:password_confirmation]
      @user.update(password_params)
      flash[:success] = "パスワードが更新されました."
      redirect_to @user
    else
      flash[:danger] = "「現在のパスワード」が間違っているか、「新しいパスワード」と「新しいパスワードの確認入力欄」が一致しません。"
      render 'edit'
    end
end
  
  private
  
  def get_user
    @user = User.find_by(id: params[:id])
  end
  
  def password_params
    params.permit(:password, :password_confirmation)
  end
end
