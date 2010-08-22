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
      @eq_pieces << EquipmentPiece.find_by_id(entry.equipment_piece_id)
    end
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_piece_list }
    end
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

  # POST /equipment_piece_lists
  # POST /equipment_piece_lists.xml
  def create
    @equipment_piece_list = EquipmentPieceList.new(params[:equipment_piece_list])

    respond_to do |format|
      if @equipment_piece_list.save
        flash[:notice] = 'EquipmentPieceList was successfully created.'
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

    respond_to do |format|
      if @equipment_piece_list.update_attributes(params[:equipment_piece_list])
        flash[:notice] = 'EquipmentPieceList was successfully updated.'
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
end
