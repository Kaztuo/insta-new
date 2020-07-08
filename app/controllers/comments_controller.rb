# frozen_string_literal: true

class CommentsController < ApplicationController
  def new; end

  def create
    @photo = Photo.find_by(id: params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'コメントしました'
      @comment.update(user_id: current_user.id)
      @comment.create_notification_comment!(current_user, @photo.id, @comment.id, @photo.user_id)
      @user = User.find(@photo.user_id)
      UserMailer.comment_notification(@user).deliver
      redirect_to photo_path(id: @photo.id)
    else
      flash.now[:danger] = 'コメントに失敗しました'
      @comments = @photo.comments.compact
      @photos = @feed_items
      render 'photos/show'
    end
  end

  def show; end

  def search
    entered = params[:searching_comment]
    if entered.present?
      @searching_keyword = entered.to_s
      @comments = Comment.where('comment LIKE ?', "%#{entered}%")
      flash.now[:danger] = 'お探しのキーワードで写真が見つかりませんでした' if @comments.blank?
      render 'comments/search'
    else
      @comments = Comment.none
      if entered.blank? && !entered.nil?
        flash.now[:danger] = '検索キーワードを入力して下さい'
        render 'comments/search'
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
