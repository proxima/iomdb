class EquipmentPiecesController < ApplicationController

  # GET /equipment_pieces
  # GET /equipment_pieces.xml
  # GET /equipment_pieces.json
  def index
    @equipment_pieces = EquipmentPiece.find(:all)
    @equipment_mobs = []
   
    if params[:search]
      @equipment_pieces = EquipmentPiece.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"], :limit => 12)
      @equipment_mobs = EquipmentMonster.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"], :limit => 3)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_pieces.to_xml(:include => {:slot_affects => {},
                                                                         :stat_affects => {},
                                                                         :resistance_affects => {},
                                                                         :skill_affects => {},
                                                                         :spell_affects => {}},
                                                            :except => [ :created_at, :updated_at ],
                                                            :skip_types => true,
                                                            :skip_instruct => true ) }
      format.json { render :json => @equipment_pieces.to_json(:include => {:slot_affects => {},
                                                                          :stat_affects => {},
                                                                          :resistance_affects => {},
                                                                          :skill_affects => {},
                                                                          :spell_affects => {}},
                                                            :except => [ :created_at, :updated_at ],
                                                            :skip_types => true,
                                                            :skip_instruct => true ) }
      format.js # index.js.erb
    end
  end

  def fetch_by_slot
    if params[:slot]
      @slot_counts = EquipmentPiece.count(:all, :joins => :slot_affects, :group => :equipment_piece_id)

      @pieces = []

      if Slot.find_by_name(params[:slot])
        @pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :order => 'name ASC', :conditions => { 'slot_affects.slot_id' => Slot.find_by_name(params[:slot]).id })
        @pieces.delete_if {|x| @slot_counts[x.id.to_s] > 1}
      elsif params[:slot] == "arms"
        @arm_slots = [ Slot.find_by_name('right arm').id, Slot.find_by_name('left arm').id ]
        @remaining = []

        @pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :order => 'name ASC', :conditions => { 'slot_affects.slot_id' => @arm_slots }).uniq

        for piece in @pieces
          if piece.slot_affects.size != 2
          elsif @arm_slots.include?(piece.slot_affects[0].slot_id) == false or @arm_slots.include?(piece.slot_affects[1].slot_id) == false
          else
            @remaining << piece
          end
        end

        @pieces = @remaining
      elsif params[:slot] == "legs"
        @leg_slots = [ Slot.find_by_name('right leg').id, Slot.find_by_name('left leg').id ]
        @remaining = []

        @pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :order => 'name ASC', :conditions => { 'slot_affects.slot_id' => @leg_slots }).uniq

        for piece in @pieces
          if piece.slot_affects.size != 2
          elsif @leg_slots.include?(piece.slot_affects[0].slot_id) == false or @leg_slots.include?(piece.slot_affects[1].slot_id) == false
          else
            @remaining << piece
          end
        end
        @pieces = @remaining
      elsif params[:slot] == "feet"
        @foot_slots = [ Slot.find_by_name('left foot').id, Slot.find_by_name('right foot').id ]
        @remaining = []

        @pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :order => 'name ASC', :conditions => { 'slot_affects.slot_id' => @foot_slots }).uniq
        for piece in @pieces
          if piece.slot_affects.size != 2
          elsif @foot_slots.include?(piece.slot_affects[0].slot_id) == false or @foot_slots.include?(piece.slot_affects[1].slot_id) == false
          else
            @remaining << piece
          end
        end

        @pieces = @remaining
      elsif params[:slot] == "hands"
        @hand_slots = [ Slot.find_by_name('left hand').id, Slot.find_by_name('right hand').id ]
        @remaining = []

        @pieces = EquipmentPiece.find(:all, :joins => :slot_affects, :order => 'name ASC', :conditions => { 'slot_affects.slot_id' => @hand_slots }).uniq
        for piece in @pieces
          if piece.slot_affects.size != 2
          elsif @hand_slots.include?(piece.slot_affects[0].slot_id) == false or @hand_slots.include?(piece.slot_affects[1].slot_id) == false
          else
            @remaining << piece
          end
        end

        @pieces = @remaining
      elsif params[:slot] == "multislot"
        @pieces = EquipmentPiece.find(:all, :order => 'name ASC')
        @remaining = []

        for piece in @pieces
          if piece.slot_affects.size < 2
          elsif piece.slot_affects.size == 2
            @hand_slots = [ Slot.find_by_name('left hand').id, Slot.find_by_name('right hand').id ]
            @foot_slots = [ Slot.find_by_name('left foot').id, Slot.find_by_name('right foot').id ]
            @leg_slots = [ Slot.find_by_name('right leg').id, Slot.find_by_name('left leg').id ]
            @arm_slots = [ Slot.find_by_name('right arm').id, Slot.find_by_name('left arm').id ]        

            if @hand_slots.include?(piece.slot_affects[0].slot_id) and @hand_slots.include?(piece.slot_affects[1].slot_id)
            elsif @foot_slots.include?(piece.slot_affects[0].slot_id) and @foot_slots.include?(piece.slot_affects[1].slot_id)
            elsif @leg_slots.include?(piece.slot_affects[0].slot_id) and @leg_slots.include?(piece.slot_affects[1].slot_id)
            elsif @arm_slots.include?(piece.slot_affects[0].slot_id) and @arm_slots.include?(piece.slot_affects[1].slot_id)
            else
              @remaining << piece
            end
          else
            @remaining << piece
          end
        end
        @pieces = @remaining
      elsif params[:slot] == "unclassified"
        @pieces = EquipmentPiece.find(:all, :order => 'name ASC')
        @remaining = []
        
        for piece in @pieces
          if piece.slot_affects.size == 0
            @remaining << piece
          end
        end
        @pieces = @remaining
      end
      render :partial => 'view', :collection => @pieces
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
      format.xml  { render :xml => @equipment_piece.to_xml(:include => {:slot_affects => {},
                                                                        :stat_affects => {},
                                                                        :resistance_affects => {},
                                                                        :skill_affects => {},
                                                                        :spell_affects => {}},
                                                           :except => [ :created_at, :updated_at ],
                                                           :skip_types => true,
                                                           :skip_instruct => true ) }

      format.json { render :json => @equipment_piece.to_json(:include => {:slot_affects => {},
                                                                          :stat_affects => {},
                                                                          :resistance_affects => {},
                                                                          :skill_affects => {},
                                                                          :spell_affects => {}},
                                                           :except => [ :created_at, :updated_at ],
                                                           :skip_types => true,
                                                           :skip_instruct => true ) }
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
