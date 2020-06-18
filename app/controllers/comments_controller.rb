class CommentsController < ApplicationController
  def new
  end

  def create
    @photo = Photo.find_by(id: params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    if @comment.save
      flash[:success] = "comment post!"
      redirect_to photo_path(id: @photo.id)
    else
      @comments = @photo.comments.compact
      render 'photos/show' 
    end
  end
  
  def show
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
