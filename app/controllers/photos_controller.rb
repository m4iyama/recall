class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @markers = @photos.map do |photo|
      {
          photo_id: photo.id,
          lat: photo.latitude,
          lng: photo.longitude,
          image_url: url_for(photo.image)
      }
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create!(photo_params)

    redirect_to photos_path
  end

  private

    def photo_params
      params.require(:photo).permit(:latitude, :longitude, :image)
    end
end
