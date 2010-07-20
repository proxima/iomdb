class HungerLevelsController < ApplicationController
  # GET /hunger_levels
  # GET /hunger_levels.xml
  # GET /hunger_levels.json
  def index
    @hunger_levels = HungerLevel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hunger_levels }
      format.json { render :json => @hunger_levels }
    end
  end

  # GET /hunger_levels/1
  # GET /hunger_levels/1.xml
  # GET /hunger_levels/1.json
  def show
    @hunger_level = HungerLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hunger_level }
      format.json { render :json => @hunger_level }
    end
  end

  # GET /hunger_levels/new
  # GET /hunger_levels/new.xml
  def new
    @hunger_level = HungerLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hunger_level }
    end
  end

  # GET /hunger_levels/1/edit
  def edit
    @hunger_level = HungerLevel.find(params[:id])
  end

  # POST /hunger_levels
  # POST /hunger_levels.xml
  def create
    @hunger_level = HungerLevel.new(params[:hunger_level])

    respond_to do |format|
      if @hunger_level.save
        flash[:notice] = 'HungerLevel was successfully created.'
        format.html { redirect_to(@hunger_level) }
        format.xml  { render :xml => @hunger_level, :status => :created, :location => @hunger_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hunger_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hunger_levels/1
  # PUT /hunger_levels/1.xml
  def update
    @hunger_level = HungerLevel.find(params[:id])

    respond_to do |format|
      if @hunger_level.update_attributes(params[:hunger_level])
        flash[:notice] = 'HungerLevel was successfully updated.'
        format.html { redirect_to(@hunger_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hunger_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hunger_levels/1
  # DELETE /hunger_levels/1.xml
  def destroy
    @hunger_level = HungerLevel.find(params[:id])
    @hunger_level.destroy

    respond_to do |format|
      format.html { redirect_to(hunger_levels_url) }
      format.xml  { head :ok }
    end
  end
end
