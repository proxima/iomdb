class SkillAffectsController < ApplicationController
  # GET /skill_affects
  # GET /skill_affects.xml
  # GET /skill_affects.json
  def index
    @skill_affects = SkillAffect.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skill_affects }
      format.json { render :json => @skill_affects }
    end
  end

  # GET /skill_affects/1
  # GET /skill_affects/1.xml
  # GET /skill_affects/1.json
  def show
    @skill_affect = SkillAffect.find(params[:id])
    @eq_piece = EquipmentPiece.find(@skill_affect.equipment_piece_id)
    @skill = Skill.find(@skill_affect.skill_id)    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @skill_affect }
      format.json { render :xml => @skill_affect }
    end
  end

  # GET /skill_affects/new
  # GET /skill_affects/new.xml
  def new
    @skill_affect = SkillAffect.new
    @skills = Skill.find(:all, :order => 'name ASC') 
    @eq_pieces = EquipmentPiece.find(:all)

    if params[:equipment_piece_id]
      @skill_affect.equipment_piece_id = params[:equipment_piece_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @skill_affect }
    end
  end

  # GET /skill_affects/1/edit
  def edit
    @skill_affect = SkillAffect.find(params[:id])
    @skills = Skill.find(:all, :order => 'name ASC') 
    @eq_pieces = EquipmentPiece.find(:all)
  end

  # POST /skill_affects
  # POST /skill_affects.xml
  def create
    @skill_affect = SkillAffect.new(params[:skill_affect])

    respond_to do |format|
      if @skill_affect.save
        flash[:notice] = 'SkillAffect was successfully created.'
        format.html { redirect_to(EquipmentPiece.find_by_id(@skill_affect.equipment_piece_id)) }
        format.xml  { render :xml => @skill_affect, :status => :created, :location => @skill_affect }
      else
        format.html # show.html.erb
        format.xml  { render :xml => @skill_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skill_affects/1
  # PUT /skill_affects/1.xml
  def update
    @skill_affect = SkillAffect.find(params[:id])

    respond_to do |format|
      if @skill_affect.update_attributes(params[:skill_affect])
        flash[:notice] = 'SkillAffect was successfully updated.'
        format.html { redirect_to(@skill_affect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @skill_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_affects/1
  # DELETE /skill_affects/1.xml
  def destroy
    @skill_affect = SkillAffect.find(params[:id])
    @skill_affect.destroy

    respond_to do |format|
      flash[:notice] = 'SkillAffect was successfully destroyed.'
      format.html { redirect_to(EquipmentPiece.find_by_id(@skill_affect.equipment_piece_id)) }
      format.xml  { head :ok }
    end
  end
end
