class PhotosController < ApplicationController
  
  def new
    @photo = Photo.new
  end
  
  def create
    @micropost = current_user.photos.build(photo_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def photo_params
      params.require(:photo).permit(:content)
    end
end
