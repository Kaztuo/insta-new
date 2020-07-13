# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show edit update destroy following followers]
  before_action :correct_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    flash[:success] = 'アカウントを削除しました'
    redirect_to root_url
  end

  def following; end

  def followers; end

  private

  def user_params
    params.require(:user).permit(:full_name, :user_name, :password, :password_confirmation,
                                 :website, :self_introduction, :email, :phone_number, :gender)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def logged_in_user
    unless user_signed_in?
      store_location
      flash[:danger] = 'ログインしてください。'
      redirect_to new_user_session_url
    end
  end
end
