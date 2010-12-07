class EquipmentPieceListTypesController < ApplicationController
  # GET /equipment_piece_list_types
  # GET /equipment_piece_list_types.xml
  def index
    @equipment_piece_list_types = EquipmentPieceListType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @equipment_piece_list_types }
    end
  end

  # GET /equipment_piece_list_types/1
  # GET /equipment_piece_list_types/1.xml
  def show
    @equipment_piece_list_type = EquipmentPieceListType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @equipment_piece_list_type }
    end
  end

  # GET /equipment_piece_list_types/new
  # GET /equipment_piece_list_types/new.xml
  def new
    @equipment_piece_list_type = EquipmentPieceListType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @equipment_piece_list_type }
    end
  end

  # GET /equipment_piece_list_types/1/edit
  def edit
    @equipment_piece_list_type = EquipmentPieceListType.find(params[:id])
  end

  # POST /equipment_piece_list_types
  # POST /equipment_piece_list_types.xml
  def create
    @equipment_piece_list_type = EquipmentPieceListType.new(params[:equipment_piece_list_type])

    respond_to do |format|
      if @equipment_piece_list_type.save
        flash[:notice] = 'EquipmentPieceListType was successfully created.'
        format.html { redirect_to(@equipment_piece_list_type) }
        format.xml  { render :xml => @equipment_piece_list_type, :status => :created, :location => @equipment_piece_list_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @equipment_piece_list_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /equipment_piece_list_types/1
  # PUT /equipment_piece_list_types/1.xml
  def update
    @equipment_piece_list_type = EquipmentPieceListType.find(params[:id])

    respond_to do |format|
      if @equipment_piece_list_type.update_attributes(params[:equipment_piece_list_type])
        flash[:notice] = 'EquipmentPieceListType was successfully updated.'
        format.html { redirect_to(@equipment_piece_list_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @equipment_piece_list_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_piece_list_types/1
  # DELETE /equipment_piece_list_types/1.xml
  def destroy
    @equipment_piece_list_type = EquipmentPieceListType.find(params[:id])
    @equipment_piece_list_type.destroy

    respond_to do |format|
      format.html { redirect_to(equipment_piece_list_types_url) }
      format.xml  { head :ok }
    end
  end
end
