class StaticPagesController < ApplicationController
  def home
    if user_signed_in? #logged_in?
      @feed_items = current_user.feed
    end
  end

  def terms_of_use
  end
end
