class MessageQueueController < ApplicationController
  
  def fetch_msg
    @messages = Message.all
    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @messages }
    end
  end

end
