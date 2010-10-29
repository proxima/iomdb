class EquipmentMonstersController < ApplicationController
  # GET /equipment_monsters
  # GET /equipment_monsters.xml
  # GET /equipment_monsters.json
  def index
    @equipment_monsters = EquipmentMonster.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_monsters.to_xml(:include => {
                                                               :equipment_pieces => {:include => {:slot_affects => {},
                                                                                                  :stat_affects => {},
                                                                                                  :resistance_affects => {},
                                                                                                  :skill_affects => {},
                                                                                                  :spell_affects => {}}},
                                                               :equipment_mob_strategy => {}},
                                                               :except => [ :created_at, :updated_at ],
                                                               :skip_types => true,
                                                               :skip_instruct => true ) } 

      format.json { render :json => @equipment_monsters.to_json(:include => {
                                                               :equipment_pieces => {:include => {:slot_affects => {}, 
                                                                                                  :stat_affects => {}, 
                                                                                                  :resistance_affects => {}, 
                                                                                                  :skill_affects => {},
                                                                                                  :spell_affects => {}}}, 
                                                               :equipment_mob_strategy => {}},
                                                               :except => [ :created_at, :updated_at ],
                                                               :skip_types => true,
                                                               :skip_instruct => true ) } 
    end
  end

  # GET /equipment_monsters/1
  # GET /equipment_monsters/1.xml
  # GET /equipment_monsters/1.json
  def show
    @equipment_monster = nil

    if params[:name]
      @equipment_monster = EquipmentMonster.find_by_name(params[:name])
      if @equipment_monster.nil?
        render :text => "tell %2 A monster of that exact name doesn't exist in iomdb.\n"
        return
      end
    else
      @equipment_monster = EquipmentMonster.find(params[:id])
    end

    @eq_pieces = @equipment_monster.equipment_pieces

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @equipment_monster.to_xml(:include => {
                                                               :equipment_pieces => {:include => {:slot_affects => {},
                                                                                                  :stat_affects => {},
                                                                                                  :resistance_affects => {},
                                                                                                  :skill_affects => {},
                                                                                                  :spell_affects => {}}},
                                                               :equipment_mob_strategy => {}},
                                                               :except => [ :created_at, :updated_at ],
                                                               :skip_types => true,
                                                               :skip_instruct => true ) } 

      format.json { render :json => @equipment_monster.to_json(:include => {
                                                               :equipment_pieces => {:include => {:slot_affects => {}, 
                                                                                                  :stat_affects => {}, 
                                                                                                  :resistance_affects => {}, 
                                                                                                  :skill_affects => {},
                                                                                                  :spell_affects => {}}}, 
                                                               :equipment_mob_strategy => {}},
                                                               :except => [ :created_at, :updated_at ],
                                                               :skip_types => true,
                                                               :skip_instruct => true ) } 
      format.text # show.txt.erb
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
end
