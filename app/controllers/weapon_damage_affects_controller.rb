class WeaponDamageAffectsController < ApplicationController
  # GET /weapon_damage_affects
  # GET /weapon_damage_affects.xml
  def index
    @weapon_damage_affects = WeaponDamageAffect.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weapon_damage_affects }
    end
  end

  # GET /weapon_damage_affects/1
  # GET /weapon_damage_affects/1.xml
  def show
    @weapon_damage_affect = WeaponDamageAffect.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weapon_damage_affect }
    end
  end

  # GET /weapon_damage_affects/new
  # GET /weapon_damage_affects/new.xml
  def new
    @weapon_damage_affect = WeaponDamageAffect.new
    if params[:equipment_piece_id]
      @weapon_damage_affect.equipment_piece_id = params[:equipment_piece_id]
    end  
  
    @weapon_damage_levels = WeaponDamageLevel.find(:all, :order => 'name ASC')
    @equipment_pieces = EquipmentPiece.find(:all, :order => 'name ASC')
    @damage_types = DamageType.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weapon_damage_affect }
    end
  end

  # GET /weapon_damage_affects/1/edit
  def edit
    @weapon_damage_affect = WeaponDamageAffect.find(params[:id])

    @weapon_damage_levels = WeaponDamageLevel.find(:all, :order => 'name ASC')
    @equipment_pieces = EquipmentPiece.find(:all, :order => 'name ASC')
    @damage_types = DamageType.find(:all, :order => 'name ASC')
  end

  # POST /weapon_damage_affects
  # POST /weapon_damage_affects.xml
  def create
    @weapon_damage_affect = WeaponDamageAffect.new(params[:weapon_damage_affect])

    respond_to do |format|
      if @weapon_damage_affect.save
        flash[:notice] = 'WeaponDamageAffect was successfully created.'
        format.html { redirect_to(@weapon_damage_affect) }
        format.xml  { render :xml => @weapon_damage_affect, :status => :created, :location => @weapon_damage_affect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weapon_damage_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weapon_damage_affects/1
  # PUT /weapon_damage_affects/1.xml
  def update
    @weapon_damage_affect = WeaponDamageAffect.find(params[:id])

    respond_to do |format|
      if @weapon_damage_affect.update_attributes(params[:weapon_damage_affect])
        flash[:notice] = 'WeaponDamageAffect was successfully updated.'
        format.html { redirect_to(@weapon_damage_affect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weapon_damage_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weapon_damage_affects/1
  # DELETE /weapon_damage_affects/1.xml
  def destroy
    @weapon_damage_affect = WeaponDamageAffect.find(params[:id])
    @weapon_damage_affect.destroy

    respond_to do |format|
      format.html { redirect_to(weapon_damage_affects_url) }
      format.xml  { head :ok }
    end
  end
end
