# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @feed_items = current_user.feed if user_signed_in? # logged_in?
  end

  def terms_of_use; end
end
