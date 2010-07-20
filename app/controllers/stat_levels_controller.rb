class StatLevelsController < ApplicationController
  # GET /stat_levels
  # GET /stat_levels.xml
  # GET /stat_levels.json
  def index
    @stat_levels = StatLevel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stat_levels }
      format.json { render :json => @stat_levels }
    end
  end

  # GET /stat_levels/1
  # GET /stat_levels/1.xml
  # GET /stat_levels/1.json
  def show
    @stat_level = StatLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stat_level }
      format.json { render :json => @stat_level }
    end
  end

  # GET /stat_levels/new
  # GET /stat_levels/new.xml
  def new
    @stat_level = StatLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stat_level }
    end
  end

  # GET /stat_levels/1/edit
  def edit
    @stat_level = StatLevel.find(params[:id])
  end

  # POST /stat_levels
  # POST /stat_levels.xml
  def create
    @stat_level = StatLevel.new(params[:stat_level])

    respond_to do |format|
      if @stat_level.save
        flash[:notice] = 'StatLevel was successfully created.'
        format.html { redirect_to(@stat_level) }
        format.xml  { render :xml => @stat_level, :status => :created, :location => @stat_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stat_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stat_levels/1
  # PUT /stat_levels/1.xml
  def update
    @stat_level = StatLevel.find(params[:id])

    respond_to do |format|
      if @stat_level.update_attributes(params[:stat_level])
        flash[:notice] = 'StatLevel was successfully updated.'
        format.html { redirect_to(@stat_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stat_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stat_levels/1
  # DELETE /stat_levels/1.xml
  def destroy
    @stat_level = StatLevel.find(params[:id])
    @stat_level.destroy

    respond_to do |format|
      format.html { redirect_to(stat_levels_url) }
      format.xml  { head :ok }
    end
  end
end
