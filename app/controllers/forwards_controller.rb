class ForwardsController < ApplicationController
  # GET /forwards
  # GET /forwards.xml
  def index
    @forwards = Forward.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forwards }
    end
  end

  # GET /forwards/1
  # GET /forwards/1.xml
  def show
    @forward = Forward.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @forward }
    end
  end

  # GET /forwards/new
  # GET /forwards/new.xml
  def new
    @forward = Forward.new
    @forward.user_id = params[:forward_user_id].to_i
    @forward.init_user_id = params[:init_user_id].to_i
    @forward.init_message_id = params[:init_message_id].to_i
    @forward.comment = '//@' + params[:init_user_name] + ':' + params[:message_content]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @forward }
    end
  end

  # GET /forwards/1/edit
  def edit
    @forward = Forward.find(params[:id])
  end

  # POST /forwards
  # POST /forwards.xml
  def create
    @forward = Forward.new(params[:forward])

    message = Message.new
    message.userid = @forward.user_id
    message.content = @forward.comment
    message.user_nick_name = session[:user].nick_name
    message.user_head_photo_url = session[:user].head_photo_url

    respond_to do |format|
      if message.save
        @forward.forward_message_id = message.id
        if @forward.save
          format.html { redirect_to :action => "index", :controller => "messages" }
          format.xml  { render :xml => @forward, :status => :created, :location => @forward }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @forward.errors, :status => :unprocessable_entity }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @forward.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /forwards/1
  # PUT /forwards/1.xml
  def update
    @forward = Forward.find(params[:id])

    respond_to do |format|
      if @forward.update_attributes(params[:forward])
        format.html { redirect_to(@forward, :notice => 'Forward was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @forward.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /forwards/1
  # DELETE /forwards/1.xml
  def destroy
    @forward = Forward.find(params[:id])
    @forward.destroy

    respond_to do |format|
      format.html { redirect_to(forwards_url) }
      format.xml  { head :ok }
    end
  end
end
