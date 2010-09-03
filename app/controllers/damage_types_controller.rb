class DamageTypesController < ApplicationController
  # GET /damage_types
  # GET /damage_types.xml
  # GET /damage_types.json
  def index
    @damage_types = DamageType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @damage_types }
      format.json { render :json => @damage_types }
    end
  end

  # GET /damage_types/1
  # GET /damage_types/1.xml
  # GET /damage_types/1.json
  def show
    @damage_type = DamageType.find(params[:id])
    @armor_pieces = ResistanceAffect.find_all_by_damage_type_id(params[:id], :order => 'value DESC')
    @weapon_pieces = WeaponDamageAffect.find_by_sql('select weapon_damage_affects.* from weapon_damage_affects inner join weapon_damage_levels where weapon_damage_affects.damage_type_id = ' + params[:id].to_s + ' and weapon_damage_affects.weapon_damage_level_id = weapon_damage_levels.id order by weapon_damage_levels.level DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @damage_type }
      format.json { render :json => @damage_type }
    end
  end

  # GET /damage_types/new
  # GET /damage_types/new.xml
  def new
    @damage_type = DamageType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @damage_type }
    end
  end

  # GET /damage_types/1/edit
  def edit
    @damage_type = DamageType.find(params[:id])
  end

  # POST /damage_types
  # POST /damage_types.xml
  def create
    @damage_type = DamageType.new(params[:damage_type])

    respond_to do |format|
      if @damage_type.save
        flash[:notice] = 'DamageType was successfully created.'
        format.html { redirect_to(@damage_type) }
        format.xml  { render :xml => @damage_type, :status => :created, :location => @damage_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @damage_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /damage_types/1
  # PUT /damage_types/1.xml
  def update
    @damage_type = DamageType.find(params[:id])

    respond_to do |format|
      if @damage_type.update_attributes(params[:damage_type])
        flash[:notice] = 'DamageType was successfully updated.'
        format.html { redirect_to(@damage_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @damage_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /damage_types/1
  # DELETE /damage_types/1.xml
  def destroy
    @damage_type = DamageType.find(params[:id])
    @damage_type.destroy

    respond_to do |format|
      format.html { redirect_to(damage_types_url) }
      format.xml  { head :ok }
    end
  end
end
