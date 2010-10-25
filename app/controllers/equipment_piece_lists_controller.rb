class EquipmentPieceListsController < ApplicationController
 
  before_filter :login_required

  # GET /equipment_piece_lists
  # GET /equipment_piece_lists.xml
  def index
    @equipment_piece_lists = EquipmentPieceList.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_piece_lists }
    end
  end

  # GET /equipment_piece_lists/1
  # GET /equipment_piece_lists/1.xml
  def show
    @equipment_piece_list = EquipmentPieceList.find(params[:id])
    @eq_pieces = []
   
    for entry in @equipment_piece_list.equipment_piece_list_entries
      @piece = EquipmentPiece.find_by_id(entry.equipment_piece_id)
      @eq_pieces << EquipmentPiece.find_by_id(entry.equipment_piece_id) if @piece
    end

    @eq_pieces = @eq_pieces.sort_by{|x| [-x[:tp_value], x[:name]]}
  
    @items_per_mob = {}
    @tps_needed_per_mob = {}

    if @equipment_piece_list.name == 'tplist'
      @all_eq = EquipmentPiece.find(:all, :conditions => 'tp_value <> 0')
      @need_to_sac = @all_eq - @eq_pieces

      @need_to_sac.group_by(&:equipment_monster).each do |mob, pieces|
        sum = 0
        pieces.each { |item| sum += item.tp_value if item.tp_value > 0 }
        @tps_needed_per_mob[mob] = sum
        @items_per_mob[mob] = []
        pieces.each { |item| @items_per_mob[mob] << item }
      end

      @items_per_mob = @items_per_mob.sort {|a,b| @tps_needed_per_mob[b[0]] <=> @tps_needed_per_mob[a[0]]}
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_piece_list }
    end
  end

  def wishlists
    @equipment_piece_lists = EquipmentPieceList.find_all_by_name('wishlist')

    @mobs_to_players = {}

    for list in @equipment_piece_lists
      for entry in list.equipment_piece_list_entries
        @piece = EquipmentPiece.find_by_id(entry.equipment_piece_id)

        @mobs_to_players[@piece.equipment_monster] = {} unless @mobs_to_players[@piece.equipment_monster]
        @mobs_to_players[@piece.equipment_monster][list.admin_user] = [] unless @mobs_to_players[@piece.equipment_monster][list.admin_user]
        @mobs_to_players[@piece.equipment_monster][list.admin_user] << @piece if @piece
      end
    end

    @mobs_to_players = @mobs_to_players.sort{|x,y| -1*(x[1].size<=>y[1].size) }
  end

  # GET /equipment_piece_lists/new
  # GET /equipment_piece_lists/new.xml
  def new
    @equipment_piece_list = EquipmentPieceList.new
    @admin_users = AdminUser.find(:all, :order => 'login ASC')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_piece_list }
    end
  end

  # GET /equipment_piece_lists/1/edit
  def edit
    @equipment_piece_list = EquipmentPieceList.find(params[:id])
    @admin_users = AdminUser.find(:all, :order => 'login ASC')
  end

  def change_list
    session[:equipment_piece_list_id] = params[:id]

    render :update do |page|
      page.replace_html 'current_eq_list', :partial => 'view'
    end
  end

  def add_to_list
    if session[:equipment_piece_list_id]
      if params[:equipment_piece_id]
        eple = EquipmentPieceListEntry.new
        eple.equipment_piece_id = params[:equipment_piece_id]
        eple.equipment_piece_list_id = session[:equipment_piece_list_id]
        eple.save
      end
    end
  end

  def remove_from_list
    if params[:equipment_piece_id] and params[:list_id]
      piece_id = params[:equipment_piece_id]
      list_id = params[:list_id]

      eple = EquipmentPieceListEntry.find_by_equipment_piece_list_id_and_equipment_piece_id(list_id, piece_id)
      eple.destroy if eple
    end
  end

  # POST /equipment_piece_lists
  # POST /equipment_piece_lists.xml
  def create
    @equipment_piece_list = EquipmentPieceList.new(params[:equipment_piece_list])
    @admin_users = AdminUser.find(:all, :order => 'login ASC')

    @pieces = []
    @not_found = []

    respond_to do |format|
      if @equipment_piece_list.save
        if !@equipment_piece_list.parchment.empty?
          @pieces, @not_found = parchment_parse(@equipment_piece_list.parchment)
          for piece in @pieces
            eple = EquipmentPieceListEntry.new
            eple.equipment_piece_id = piece.id
            eple.equipment_piece_list_id = @equipment_piece_list.id
            eple.save
          end
        end

        base_message = 'Equipment piece list was successfully created.<br><br>'
        not_found_message = "The following items didn't match an item in iomdb.  Please mudmail this list to Proxima:<br>"
        for line in @not_found
          not_found_message = not_found_message + line + "<br>"
        end

        if @not_found.size > 0
          base_message = base_message + not_found_message
        end
        flash[:notice] = base_message
        format.html { redirect_to(@equipment_piece_list) }
        format.xml  { render :xml => @equipment_piece_list, :status => :created, :location => @equipment_piece_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_piece_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_piece_lists/1
  # PUT /equipment_piece_lists/1.xml
  def update
    @equipment_piece_list = EquipmentPieceList.find(params[:id])

    @pieces = []
    @not_found = []

    respond_to do |format|
      if @equipment_piece_list.update_attributes(params[:equipment_piece_list])
        if !@equipment_piece_list.parchment.empty?
          @pieces, @not_found = parchment_parse(@equipment_piece_list.parchment)
          for piece in @pieces
            eple = EquipmentPieceListEntry.new
            eple.equipment_piece_id = piece.id
            eple.equipment_piece_list_id = @equipment_piece_list.id
            eple.save
          end
        end

        base_message = 'Equipment piece list was successfully updated.<br><br>'
        not_found_message = "The following items didn't match an item in iomdb.  Please mudmail this list to Proxima:<br>"
        for line in @not_found
          not_found_message = not_found_message + line + "<br>"
        end

        if @not_found.size > 0
          base_message = base_message + not_found_message
        end
        flash[:notice] = base_message
        format.html { redirect_to(@equipment_piece_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_piece_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_piece_lists/1
  # DELETE /equipment_piece_lists/1.xml
  def destroy
    @equipment_piece_list = EquipmentPieceList.find(params[:id])
    @equipment_piece_list.destroy

    respond_to do |format|
      format.html { redirect_to(equipment_piece_lists_url) }
      format.xml  { head :ok }
    end
  end

  private

  def parchment_parse(parchment_text)
    @eq_pieces = []
    @not_found = []

    parchment_text.each_line do |line|
      temp = line.chomp
      piece = EquipmentPiece.find_by_name(temp)
      if piece
        @eq_pieces << piece
      else
        @not_found << temp
      end
    end

    return @eq_pieces, @not_found
  end


end
