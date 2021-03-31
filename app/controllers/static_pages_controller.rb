require 'flickr'

class StaticPagesController < ApplicationController

  def index
    @flickr = Flickr.new
    
    if params[:user_id]
      begin
        @user = @flickr.people.getInfo :user_id => params[:user_id]
        @photos = @flickr.people.getPublicPhotos :user_id => params[:user_id]
      rescue Flickr::FailedResponse
        flash[:alert] = "User not found"
        render :index
      end
      
    end
  end

end
