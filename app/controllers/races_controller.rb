class RacesController < ApplicationController
  # GET /races
  # GET /races.xml
  # GET /races.json
  def index
    @races = Race.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @races }
      format.json { render :json => @races }
    end
  end

  # GET /races/1
  # GET /races/1.xml
  # GET /races/1.json
  def show
    @race = Race.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @race }
      format.json { render :json => @race }
    end
  end

  # GET /races/new
  # GET /races/new.xml
  def new
    @race = Race.new
    @stat_levels = StatLevel.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # GET /races/1/edit
  def edit
    @race = Race.find(params[:id])
    @stat_levels = StatLevel.find(:all)
  end

  # POST /races
  # POST /races.xml
  def create
    @race = Race.new(params[:race])

    respond_to do |format|
      if @race.save
        flash[:notice] = 'Race was successfully created.'
        format.html { redirect_to(@race) }
        format.xml  { render :xml => @race, :status => :created, :location => @race }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /races/1
  # PUT /races/1.xml
  def update
    @race = Race.find(params[:id])

    respond_to do |format|
      if @race.update_attributes(params[:race])
        flash[:notice] = 'Race was successfully updated.'
        format.html { redirect_to(@race) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.xml
  def destroy
    @race = Race.find(params[:id])
    @race.destroy

    respond_to do |format|
      format.html { redirect_to(races_url) }
      format.xml  { head :ok }
    end
  end
end
