class SpellAffectsController < ApplicationController
  # GET /spell_affects
  # GET /spell_affects.xml
  # GET /spell_affects.json
  def index
    @spell_affects = SpellAffect.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spell_affects }
      format.json { render :json => @spell_affects }
    end
  end

  # GET /spell_affects/1
  # GET /spell_affects/1.xml
  # GET /spell_affects/1.json
  def show
    @spell_affect = SpellAffect.find(params[:id])
    @eq_piece = EquipmentPiece.find(@skill_affect.equipment_piece_id)
    @spell = Spell.find(@spell_affect.spell_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spell_affect }
      format.json { render :json => @spell_affect }
    end
  end

  # GET /spell_affects/new
  # GET /spell_affects/new.xml
  def new
    @spell_affect = SpellAffect.new
    @spells = Spell.find(:all, :order => 'name ASC')
    @eq_pieces = EquipmentPiece.find(:all)

    if params[:equipment_piece_id]
      @spell_affect.equipment_piece_id = params[:equipment_piece_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spell_affect }
    end
  end

  # GET /spell_affects/1/edit
  def edit
    @spell_affect = SpellAffect.find(params[:id])
    @spells = Spell.find(:all, :order => 'name ASC')
    @eq_pieces = EquipmentPiece.find(:all)
  end

  # POST /spell_affects
  # POST /spell_affects.xml
  def create
    @spell_affect = SpellAffect.new(params[:spell_affect])

    respond_to do |format|
      if @spell_affect.save
        flash[:notice] = 'SpellAffect was successfully created.'
	format.html { redirect_to(EquipmentPiece.find_by_id(@spell_affect.equipment_piece_id)) }
        format.xml  { render :xml => @spell_affect, :status => :created, :location => @spell_affect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spell_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spell_affects/1
  # PUT /spell_affects/1.xml
  def update
    @spell_affect = SpellAffect.find(params[:id])

    respond_to do |format|
      if @spell_affect.update_attributes(params[:spell_affect])
        flash[:notice] = 'SpellAffect was successfully updated.'
        format.html { redirect_to(@spell_affect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spell_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_affects/1
  # DELETE /spell_affects/1.xml
  def destroy
    @spell_affect = SpellAffect.find(params[:id])
    @spell_affect.destroy

    respond_to do |format|
      flash[:notice] = 'SpellAffect was successfully destroyed.'
      format.html { redirect_to(EquipmentPiece.find_by_id(@spell_affect.equipment_piece_id)) }
      format.xml  { head :ok }
    end
  end
end
