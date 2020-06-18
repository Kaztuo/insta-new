class StaticPagesController < ApplicationController
  def home
    if logged_in?
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
