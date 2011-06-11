class FollowUserController < ApplicationController

  def follow
    id = params[:id]
    fid = params[:fid]

    item = UserLinkUser.new
    item.user_id = id
    item.linked_user_id = fid
    item.save

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

end
