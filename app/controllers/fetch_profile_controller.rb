class FetchProfileController < ApplicationController
  def fetch_profile
    id = params[:id]

    ActiveRecord::Base.connection.execute("SELECT count(*) FROM user_link_users WHERE user_id = " + id).each do |row|
      @following = row[0] - 1
    end

    ActiveRecord::Base.connection.execute("SELECT count(*) FROM user_link_users WHERE linked_user_id = " + id).each do |row|
      @fans = row[0] - 1
    end

    ActiveRecord::Base.connection.execute("SELECT count(*) FROM messages WHERE userid = " + id).each do |row|
      @message_count = row[0]
    end

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

end
