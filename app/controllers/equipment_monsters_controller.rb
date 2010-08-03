class EquipmentMonstersController < ApplicationController
  # GET /equipment_monsters
  # GET /equipment_monsters.xml
  # GET /equipment_monsters.json
  def index
    @equipment_monsters = EquipmentMonster.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_monsters }
      format.json { render :json => @equipment_monsters }
    end
  end

  # GET /equipment_monsters/1
  # GET /equipment_monsters/1.xml
  # GET /equipment_monsters/1.json
  def show
    if params[:name]
      @equipment_monster = EquipmentMonster.find_by_name(params[:name])
    else
      @equipment_monster = EquipmentMonster.find(params[:id])
    end

    @versions = @equipment_monster.versions.find(:all)
    @eq_pieces = @equipment_monster.equipment_pieces

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_monster }
      format.json { render :json => @equipment_monster }
    end
  end

  # GET /equipment_monsters/new
  # GET /equipment_monsters/new.xml
  def new
    @equipment_monster = EquipmentMonster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_monster }
    end
  end

  # GET /equipment_monsters/1/edit
  def edit
    @equipment_monster = EquipmentMonster.find(params[:id])
  end

  # POST /equipment_monsters
  # POST /equipment_monsters.xml
  def create
    @equipment_monster = EquipmentMonster.new(params[:equipment_monster])

    respond_to do |format|
      if @equipment_monster.save
        flash[:notice] = 'EquipmentMonster was successfully created.'
        format.html { redirect_to(@equipment_monster) }
        format.xml  { render :xml => @equipment_monster, :status => :created, :location => @equipment_monster }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_monster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_monsters/1
  # PUT /equipment_monsters/1.xml
  def update
    @equipment_monster = EquipmentMonster.find(params[:id])

    respond_to do |format|
      if @equipment_monster.update_attributes(params[:equipment_monster])
        flash[:notice] = 'EquipmentMonster was successfully updated.'
        format.html { redirect_to(@equipment_monster) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_monster.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_monsters/1
  # DELETE /equipment_monsters/1.xml
  def destroy
    @equipment_monster = EquipmentMonster.find(params[:id])
    @equipment_monster.destroy

    respond_to do |format|
      format.html { redirect_to(equipment_monsters_url) }
      format.xml  { head :ok }
    end
  end

  def restore
    @equipment_monster = EquipmentMonster.find(params[:equipment_monster_id])
    @equipment_monster.revert_to! params[:version_id]

    flash[:notice] = "EquipmentMonster was successfully restored to version #{params[:version_id]}"
    redirect_to(@equipment_monster)
  end
end
