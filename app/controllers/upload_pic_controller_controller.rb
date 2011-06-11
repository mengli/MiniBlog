class UploadPicControllerController < ApplicationController
  
  def get
    @picture = Picture.new
  end

  def save
    @picture = Picture.new(params[:picture])

    File.open("public/images/head/" + session[:user].nick_name + ".jpg", "wb") do |f|
      f.write(@picture.data)
    end

    @user = User.find(session[:user].id)
    @user.head_photo_url = "/images/head/" + session[:user].nick_name + ".jpg"
    @user.update_attributes([:head_photo_url])

    session[:user].head_photo_url = "/images/head/" + session[:user].nick_name + ".jpg"
    
    redirect_to messages_url
    
  end


end
