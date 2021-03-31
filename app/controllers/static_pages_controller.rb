require 'flickr'

class StaticPagesController < ApplicationController

  def index
    @flickr = Flickr.new
    
    if params[:user_id]
      @user = @flickr.people.getInfo :user_id => params[:user_id]
      @photos = @flickr.people.getPublicPhotos :user_id => params[:user_id]
      get_photos_url
    end
  end

  private

  def get_photos_url
    @photos_url = Array.new

    @photos.each do |photo|
      @photos_url << "https://live.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
    end

  end

end
