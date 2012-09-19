class PhotosController < ApplicationController
  
  def index
    respond_with @photos = Photo.page(params[:page]).per(16)
  end
  
  def show
    respond_with @photo = Photo.find(params[:id])
  end
  
end