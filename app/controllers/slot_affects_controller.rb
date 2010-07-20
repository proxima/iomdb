class SlotAffectsController < ApplicationController
  # GET /slot_affects
  # GET /slot_affects.xml
  # GET /slot_affects.json
  def index
    @slot_affects = SlotAffect.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slot_affects }
      format.json { render :json => @slot_affects }
    end
  end

  # GET /slot_affects/1
  # GET /slot_affects/1.xml
  # GET /slot_affects/1.json
  def show
    @slot_affect = SlotAffect.find(params[:id])
    @eq_piece = EquipmentPiece.find(@slot_affect.equipment_piece_id)
    @slot = Slot.find(@slot_affect.slot_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slot_affect }
      format.json { render :json => @slot_affect }
    end
  end

  # GET /slot_affects/new
  # GET /slot_affects/new.xml
  def new
    @slot_affect = SlotAffect.new
    @slots = Slot.find(:all)
    @eq_pieces = EquipmentPiece.find(:all)

    if params[:equipment_piece_id]
      @slot_affect.equipment_piece_id = params[:equipment_piece_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slot_affect }
    end
  end

  # GET /slot_affects/1/edit
  def edit
    @slot_affect = SlotAffect.find(params[:id])
    @slots = Slot.find(:all)
    @eq_pieces = EquipmentPiece.find(:all)
  end

  # POST /slot_affects
  # POST /slot_affects.xml
  def create
    @slot_affect = SlotAffect.new(params[:slot_affect])

    respond_to do |format|
      if @slot_affect.save
        flash[:notice] = 'SlotAffect was successfully created.'
        format.html { redirect_to(EquipmentPiece.find_by_id(@slot_affect.equipment_piece_id)) }
        format.xml  { render :xml => @slot_affect, :status => :created, :location => @slot_affect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slot_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /slot_affects/1
  # PUT /slot_affects/1.xml
  def update
    @slot_affect = SlotAffect.find(params[:id])

    respond_to do |format|
      if @slot_affect.update_attributes(params[:slot_affect])
        flash[:notice] = 'SlotAffect was successfully updated.'
        format.html { redirect_to(@slot_affect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slot_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slot_affects/1
  # DELETE /slot_affects/1.xml
  def destroy
    @slot_affect = SlotAffect.find(params[:id])
    @slot_affect.destroy

    respond_to do |format|
      flash[:notice] = 'SlotAffect was successfully deleted.'
      format.html { redirect_to(EquipmentPiece.find_by_id(@slot_affect.equipment_piece_id)) }
      format.xml  { head :ok }
    end
  end
end
