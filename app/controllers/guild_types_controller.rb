class GuildTypesController < ApplicationController
  # GET /guild_types
  # GET /guild_types.xml
  # GET /guild_types.json
  def index
    @guild_types = GuildType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @guild_types }
      format.json { render :json => @guild_types }
    end
  end

  # GET /guild_types/1
  # GET /guild_types/1.xml
  # GET /guild_types/1.json
  def show
    @guild_type = GuildType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @guild_type }
      format.json { render :json => @guild_type }
    end
  end

  # GET /guild_types/new
  # GET /guild_types/new.xml
  def new
    @guild_type = GuildType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @guild_type }
    end
  end

  # GET /guild_types/1/edit
  def edit
    @guild_type = GuildType.find(params[:id])
  end

  # POST /guild_types
  # POST /guild_types.xml
  def create
    @guild_type = GuildType.new(params[:guild_type])

    respond_to do |format|
      if @guild_type.save
        flash[:notice] = 'GuildType was successfully created.'
        format.html { redirect_to(@guild_type) }
        format.xml  { render :xml => @guild_type, :status => :created, :location => @guild_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @guild_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guild_types/1
  # PUT /guild_types/1.xml
  def update
    @guild_type = GuildType.find(params[:id])

    respond_to do |format|
      if @guild_type.update_attributes(params[:guild_type])
        flash[:notice] = 'GuildType was successfully updated.'
        format.html { redirect_to(@guild_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guild_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guild_types/1
  # DELETE /guild_types/1.xml
  def destroy
    @guild_type = GuildType.find(params[:id])
    @guild_type.destroy

    respond_to do |format|
      format.html { redirect_to(guild_types_url) }
      format.xml  { head :ok }
    end
  end
end
