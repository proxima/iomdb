class EquipmentMobStrategiesController < ApplicationController
  # GET /equipment_mob_strategies
  # GET /equipment_mob_strategies.xml
  def index
    @equipment_mob_strategies = EquipmentMobStrategy.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_mob_strategies }
    end
  end

  # GET /equipment_mob_strategies/1
  # GET /equipment_mob_strategies/1.xml
  def show
    @equipment_mob_strategy = EquipmentMobStrategy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_mob_strategy }
    end
  end

  # GET /equipment_mob_strategies/new
  # GET /equipment_mob_strategies/new.xml
  def new
    @equipment_mob_strategy = EquipmentMobStrategy.new
    @equipment_mobs = EquipmentMonster.find(:all, :order => 'name ASC')
    @damage_types = DamageType.find(:all, :order => 'name ASC')

    if params[:equipment_monster_id]
      @equipment_mob_strategy.equipment_monster_id = params[:equipment_monster_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_mob_strategy }
    end
  end

  # GET /equipment_mob_strategies/1/edit
  def edit
    @equipment_mob_strategy = EquipmentMobStrategy.find(params[:id])
    @equipment_mobs = EquipmentMonster.find(:all, :order => 'name ASC')
    @damage_types = DamageType.find(:all, :order => 'name ASC')
  end

  # POST /equipment_mob_strategies
  # POST /equipment_mob_strategies.xml
  def create
    @equipment_mob_strategy = EquipmentMobStrategy.new(params[:equipment_mob_strategy])

    respond_to do |format|
      if @equipment_mob_strategy.save
        flash[:notice] = 'EquipmentMobStrategy was successfully created.'
        format.html { redirect_to(@equipment_mob_strategy) }
        format.xml  { render :xml => @equipment_mob_strategy, :status => :created, :location => @equipment_mob_strategy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_mob_strategy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_mob_strategies/1
  # PUT /equipment_mob_strategies/1.xml
  def update
    @equipment_mob_strategy = EquipmentMobStrategy.find(params[:id])

    respond_to do |format|
      if @equipment_mob_strategy.update_attributes(params[:equipment_mob_strategy])
        flash[:notice] = 'EquipmentMobStrategy was successfully updated.'
        format.html { redirect_to(@equipment_mob_strategy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_mob_strategy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_mob_strategies/1
  # DELETE /equipment_mob_strategies/1.xml
  def destroy
    @equipment_mob_strategy = EquipmentMobStrategy.find(params[:id])
    @equipment_mob_strategy.destroy

    respond_to do |format|
      format.html { redirect_to(equipment_mob_strategies_url) }
      format.xml  { head :ok }
    end
  end
end
