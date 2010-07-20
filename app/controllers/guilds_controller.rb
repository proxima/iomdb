class GuildsController < ApplicationController
  # GET /guilds
  # GET /guilds.xml
  def index
    @guilds = Guild.paginate :page => params[:page], :order => 'name ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @guilds }
    end
  end

  # GET /guilds/1
  # GET /guilds/1.xml
  def show
    @guild = Guild.find(params[:id])
    @versions = @guild.versions.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @guild }
    end
  end

  # GET /guilds/new
  # GET /guilds/new.xml
  def new
    @guild = Guild.new
    @guild_types = GuildType.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @guild }
    end
  end

  # GET /guilds/1/edit
  def edit
    @guild = Guild.find(params[:id])
    @guild_types = GuildType.find(:all)
  end

  # POST /guilds
  # POST /guilds.xml
  def create
    @guild = Guild.new(params[:guild])

    respond_to do |format|
      if @guild.save
        flash[:notice] = 'Guild was successfully created.'
        format.html { redirect_to(@guild) }
        format.xml  { render :xml => @guild, :status => :created, :location => @guild }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @guild.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guilds/1
  # PUT /guilds/1.xml
  def update
    @guild = Guild.find(params[:id])

    respond_to do |format|
      if @guild.update_attributes(params[:guild])
        flash[:notice] = 'Guild was successfully updated.'
        format.html { redirect_to(@guild) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guild.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guilds/1
  # DELETE /guilds/1.xml
  def destroy
    @guild = Guild.find(params[:id])
    @guild.destroy

    respond_to do |format|
      format.html { redirect_to(guilds_url) }
      format.xml  { head :ok }
    end
  end

  def restore
    @guild = Guild.find(params[:guild_id])
    @guild.revert_to! params[:version_id]

    flash[:notice] = "Guild was successfully restored to version #{params[:version_id]}"
    redirect_to(@guild)
  end

end
