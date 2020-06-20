class ApplicationController < ActionController::Base
    include SessionsHelper

  before_action :set_search

  def set_search
    @search = Comment.ransack(params[:q])
    @search_comments = @search.result(distinct: true)
  end

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end