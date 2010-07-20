class DamageLevelsController < ApplicationController
  # GET /damage_levels
  # GET /damage_levels.xml
  # GET /damage_levels.json
  def index
    @damage_levels = DamageLevel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @damage_levels }
      format.json { render :json => @damage_levels }
    end
  end

  # GET /damage_levels/1
  # GET /damage_levels/1.xml
  # GET /damage_levels/1.json
  def show
    @damage_level = DamageLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @damage_level }
      format.json { render :json => @damage_level }
    end
  end

  # GET /damage_levels/new
  # GET /damage_levels/new.xml
  def new
    @damage_level = DamageLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @damage_level }
    end
  end

  # GET /damage_levels/1/edit
  def edit
    @damage_level = DamageLevel.find(params[:id])
  end

  # POST /damage_levels
  # POST /damage_levels.xml
  def create
    @damage_level = DamageLevel.new(params[:damage_level])

    respond_to do |format|
      if @damage_level.save
        flash[:notice] = 'DamageLevel was successfully created.'
        format.html { redirect_to(@damage_level) }
        format.xml  { render :xml => @damage_level, :status => :created, :location => @damage_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @damage_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /damage_levels/1
  # PUT /damage_levels/1.xml
  def update
    @damage_level = DamageLevel.find(params[:id])

    respond_to do |format|
      if @damage_level.update_attributes(params[:damage_level])
        flash[:notice] = 'DamageLevel was successfully updated.'
        format.html { redirect_to(@damage_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @damage_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /damage_levels/1
  # DELETE /damage_levels/1.xml
  def destroy
    @damage_level = DamageLevel.find(params[:id])
    @damage_level.destroy

    respond_to do |format|
      format.html { redirect_to(damage_levels_url) }
      format.xml  { head :ok }
    end
  end
end
