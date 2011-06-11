class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render :layout => false } # new.html.erb
    end
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user] = user
      prf = Profile.find_by_user_id(user.id)
      if prf != nil
        session[:profile] = prf
      end
      redirect_to messages_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destory
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logout"
  end



end
