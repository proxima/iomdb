class WeaponDamageLevelsController < ApplicationController
  # GET /weapon_damage_levels
  # GET /weapon_damage_levels.xml
  def index
    @weapon_damage_levels = WeaponDamageLevel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weapon_damage_levels }
    end
  end

  # GET /weapon_damage_levels/1
  # GET /weapon_damage_levels/1.xml
  def show
    @weapon_damage_level = WeaponDamageLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weapon_damage_level }
    end
  end

  # GET /weapon_damage_levels/new
  # GET /weapon_damage_levels/new.xml
  def new
    @weapon_damage_level = WeaponDamageLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weapon_damage_level }
    end
  end

  # GET /weapon_damage_levels/1/edit
  def edit
    @weapon_damage_level = WeaponDamageLevel.find(params[:id])
  end

  # POST /weapon_damage_levels
  # POST /weapon_damage_levels.xml
  def create
    @weapon_damage_level = WeaponDamageLevel.new(params[:weapon_damage_level])

    respond_to do |format|
      if @weapon_damage_level.save
        flash[:notice] = 'WeaponDamageLevel was successfully created.'
        format.html { redirect_to(@weapon_damage_level) }
        format.xml  { render :xml => @weapon_damage_level, :status => :created, :location => @weapon_damage_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weapon_damage_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weapon_damage_levels/1
  # PUT /weapon_damage_levels/1.xml
  def update
    @weapon_damage_level = WeaponDamageLevel.find(params[:id])

    respond_to do |format|
      if @weapon_damage_level.update_attributes(params[:weapon_damage_level])
        flash[:notice] = 'WeaponDamageLevel was successfully updated.'
        format.html { redirect_to(@weapon_damage_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weapon_damage_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_damage_levels/1
  # DELETE /weapon_damage_levels/1.xml
  def destroy
    @weapon_damage_level = WeaponDamageLevel.find(params[:id])
    @weapon_damage_level.destroy

    respond_to do |format|
      format.html { redirect_to(weapon_damage_levels_url) }
      format.xml  { head :ok }
    end
  end
end
