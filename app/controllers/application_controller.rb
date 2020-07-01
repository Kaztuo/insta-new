class ApplicationController < ActionController::Base
    include SessionsHelper

  # before_action :set_search

  # def set_search
  #   @q = Comment.ransack(params[:q])
  #   @search_comments = @q.result(distinct: true)
  # end

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless user_signed_in? #logged_in?から変更
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to new_user_session_url #login_url
      end
    end
end