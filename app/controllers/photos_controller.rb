class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @upload_photo = current_user.photos.build(photo_params)
    @upload_photo.image.attach(params[:photo][:image])
    if @upload_photo.save
      flash[:success] = "写真がアップロードされました！"
      redirect_to photo_path(id: @upload_photo.id)
    else
      flash.now[:danger] = "再度、写真をアップロードしてください"
      render 'photos/new'
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    @like = Like.new
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:image)
    end
end
