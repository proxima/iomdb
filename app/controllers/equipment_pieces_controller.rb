class EquipmentPiecesController < ApplicationController
  # GET /equipment_pieces
  # GET /equipment_pieces.xml
  # GET /equipment_pieces.json
  def index
    @slot_counts = EquipmentPiece.count(:all, :joins => :slot_affects, :group => :equipment_piece_id)
    
    @head_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('head').id })
    @head_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    @eye_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('eyes').id })
    @eye_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}
 
    @neck_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('neck').id })
    @neck_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    @cloak_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('cloak').id })
    @cloak_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    @amulet_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('amulet').id })
    @amulet_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    @torso_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('torso').id })
    @torso_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    @arms_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => [ Slot.find_by_name('right arm').id, Slot.find_by_name('left arm').id ] }).uniq
    @arms_pieces.delete_if {|x| @slot_counts[x.id.to_s] != 2}
     
    @right_arm_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('right arm').id })
    @right_arm_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    @left_arm_pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :conditions => { 'slot_affects.slot_id' => Slot.find_by_name('left arm').id })
    @left_arm_pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_pieces }
      format.json { render :json => @equipment_pieces }
    end
  end

  # GET /equipment_pieces/1
  # GET /equipment_pieces/1.xml
  # GET /equipment_pieces/1.json
  def show
    if params[:name]
      @equipment_piece = EquipmentPiece.find_by_name(params[:name])
    else
      @equipment_piece = EquipmentPiece.find(params[:id])
    end

    @eq_mob = EquipmentMonster.find(@equipment_piece.equipment_monster_id)
    @versions = @equipment_piece.versions.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_piece }
      format.json { render :json => @equipment_piece }
    end
  end

  # GET /equipment_pieces/new
  # GET /equipment_pieces/new.xml
  def new
    @equipment_piece = EquipmentPiece.new
    @equipment_monsters = EquipmentMonster.find(:all, :order => 'name ASC')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_piece }
    end
  end

  # GET /equipment_pieces/1/edit
  def edit
    @equipment_piece = EquipmentPiece.find(params[:id])
    @equipment_monsters = EquipmentMonster.find(:all, :order => 'name ASC')
  end

  # POST /equipment_pieces
  # POST /equipment_pieces.xml
  def create
    @equipment_piece = EquipmentPiece.new(params[:equipment_piece])

    respond_to do |format|
      if @equipment_piece.save
        flash[:notice] = 'EquipmentPiece was successfully created.'
        format.html { redirect_to(@equipment_piece) }
        format.xml  { render :xml => @equipment_piece, :status => :created, :location => @equipment_piece }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_pieces/1
  # PUT /equipment_pieces/1.xml
  def update
    @equipment_piece = EquipmentPiece.find(params[:id])

    respond_to do |format|
      if @equipment_piece.update_attributes(params[:equipment_piece])
        flash[:notice] = 'EquipmentPiece was successfully updated.'
        format.html { redirect_to(@equipment_piece) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_piece.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_pieces/1
  # DELETE /equipment_pieces/1.xml
  def destroy
    @equipment_piece = EquipmentPiece.find(params[:id])
    @equipment_piece.destroy

    respond_to do |format|
      format.html { redirect_to(equipment_pieces_url) }
      format.xml  { head :ok }
    end
  end

  def restore
    @equipment_piece = EquipmentPiece.find(params[:equipment_piece_id])
    @equipment_piece.revert_to! params[:version_id]

    flash[:notice] = "EquipmentPiece was successfully restored to version #{params[:version_id]}"
    redirect_to(@equipment_piece)
  end
end
