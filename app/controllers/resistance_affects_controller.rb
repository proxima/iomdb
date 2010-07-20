class ResistanceAffectsController < ApplicationController
  # GET /resistance_affects
  # GET /resistance_affects.xml
  # GET /resistance_affects.json
  def index
    @resistance_affects = ResistanceAffect.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resistance_affects }
      format.json { render :json => @resistance_affects }
    end
  end

  # GET /resistance_affects/1
  # GET /resistance_affects/1.xml
  # GET /resistance_affects/1.json
  def show
    @resistance_affect = ResistanceAffect.find(params[:id])
    @eq_piece = EquipmentPiece.find(@resistance_affect.equipment_piece_id)
    @damage_type = DamageType.find(@resistance_affect.damage_type_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @resistance_affect }
      format.json { render :json => @resistance_affect }
    end
  end

  # GET /resistance_affects/new
  # GET /resistance_affects/new.xml
  def new
    @resistance_affect = ResistanceAffect.new
    @damage_types = DamageType.find(:all)
    @eq_pieces = EquipmentPiece.find(:all)

    if params[:equipment_piece_id]
      @resistance_affect.equipment_piece_id = params[:equipment_piece_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resistance_affect }
    end
  end

  # GET /resistance_affects/1/edit
  def edit
    @resistance_affect = ResistanceAffect.find(params[:id])
    @damage_types = DamageType.find(:all)
    @eq_pieces = EquipmentPiece.find(:all)
  end

  # POST /resistance_affects
  # POST /resistance_affects.xml
  def create
    @resistance_affect = ResistanceAffect.new(params[:resistance_affect])

    respond_to do |format|
      if @resistance_affect.save
        flash[:notice] = 'ResistanceAffect was successfully created.'
	format.html { redirect_to(EquipmentPiece.find_by_id(@resistance_affect.equipment_piece_id)) }
        format.xml  { render :xml => @resistance_affect, :status => :created, :location => @resistance_affect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resistance_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resistance_affects/1
  # PUT /resistance_affects/1.xml
  def update
    @resistance_affect = ResistanceAffect.find(params[:id])

    respond_to do |format|
      if @resistance_affect.update_attributes(params[:resistance_affect])
        flash[:notice] = 'ResistanceAffect was successfully updated.'
        format.html { redirect_to(@resistance_affect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resistance_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resistance_affects/1
  # DELETE /resistance_affects/1.xml
  def destroy
    @resistance_affect = ResistanceAffect.find(params[:id])
    @resistance_affect.destroy

    respond_to do |format|
      flash[:notice] = 'ResistanceAffect was successfully destroyed.'
      format.html { redirect_to(EquipmentPiece.find_by_id(@resistance_affect.equipment_piece_id)) }
      format.xml  { head :ok }
    end
  end
end
