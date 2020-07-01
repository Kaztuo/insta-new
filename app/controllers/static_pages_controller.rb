class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def home
    if user_signed_in? #logged_in?
      #@photo = current_user.photos.build
      @feed_items = current_user.feed
        # @feed_items.each do |feed_photo|
        # @photo = Photo.find_by(id: feed_photo.id)
        # end
    end
  end

  def terms_of_use
  end
end
