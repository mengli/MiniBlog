class SuggestUsersController < ApplicationController
  
  def guess

    @s_users = User.find_by_sql('SELECT * FROM users WHERE users.id not in (SELECT linked_user_id FROM user_link_users WHERE user_id = ' + session[:user].id.to_s + ') LIMIT 10')

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @s_users }
    end

  end

end
