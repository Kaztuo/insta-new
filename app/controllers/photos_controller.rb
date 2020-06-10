class PhotosController < ApplicationController
  
  def new
    @photo = Photo.new
  end
  
  def create
    @uplaad_photo = current_user.photos.build(photo_params)
    if @uplaad_photo.save
      flash[:success] = "写真がアップロードされました！"
      redirect_to photo_path(current_user)
    else
      render 'photos/new'
    end
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:content)
    end
end
