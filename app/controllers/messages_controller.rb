class MessagesController < ApplicationController

  # GET /messages
  # GET /messages.xml
  def index
    get_messages

    @message = Message.new
    
    respond_to do |format|
      format.html { render :layout => false } # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    @message.userid = session[:user].id
    @message.user_nick_name = session[:profile].nick_name
    @message.user_head_photo_url = session[:user].head_photo_url
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to(@message, :notice => 'Message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end

  def get_messages
    user_coll = UserLinkUser.find_all_by_user_id(session[:user].id)

    @messages = []
    user_coll.each { |fu|
      @messages += Message.find_all_by_userid(fu.linked_user_id)
    }

    @messages.sort! { |a, b| b.created_at <=> a.created_at }
  end

end
