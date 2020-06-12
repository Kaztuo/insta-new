class PhotosController < ApplicationController
  
  def new
    @photo = Photo.new
  end
  
  def create
    @upload_photo = current_user.photos.build(photo_params)
    @upload_photo.image.attach(params[:photo][:image])
    if @upload_photo.save
      flash[:success] = "写真がアップロードされました！"
      redirect_to photo_path(id: @upload_photo.id)
    else
      render 'photos/new'
    end
  end
  
  def show
    @photos = Photo.find(params[:id])
    @comments = @photos.comments
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:id, :image)
    end
end
