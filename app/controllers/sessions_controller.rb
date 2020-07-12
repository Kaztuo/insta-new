# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.valid_password?(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:danger] = 'ユーザーネームとパスワードの組み合わせが誤っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
