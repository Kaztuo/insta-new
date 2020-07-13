# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i[edit update]

  def new; end

  def edit; end

  def create; end

  def update
    user = User.find_by(params[:id])
    if user.valid_password?(params[:password_exist]) && params[:password_new] == params[:password_confirmation]
      @user.update_attribute(:password, params[:password_new])
      sign_in @user
      flash[:success] = 'パスワードが更新されました.'
      redirect_to @user
    else
      flash[:danger] = '「現在のパスワード」が間違っているか、「新しいパスワード」と「新しいパスワードの確認入力欄」が一致しません。'
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
