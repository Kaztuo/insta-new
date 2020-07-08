# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(photo_id: params[:photo_id])
    photo = Photo.find_by(id: params[:photo_id])
    photo.create_notification_like!(current_user)
    @user = User.find(photo.user_id)
    UserMailer.like_notification(@user).deliver
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(photo_id: params[:photo_id], user_id: current_user.id)
    @like.destroy
    redirect_to root_path
  end
end
