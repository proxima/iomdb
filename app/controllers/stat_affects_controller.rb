class StatAffectsController < ApplicationController
  # GET /stat_affects
  # GET /stat_affects.xml
  # GET /stat_affects.json
  def index
    @stat_affects = StatAffect.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stat_affects }
      format.json { render :xml => @stat_affects }
    end
  end

  # GET /stat_affects/1
  # GET /stat_affects/1.xml
  # GET /stat_affects/1.json
  def show
    @stat_affect = StatAffect.find(params[:id])
    @eq_piece = EquipmentPiece.find(@stat_affect.equipment_piece_id)
    @stat = Stat.find(@stat_affect.stat_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stat_affect }
      format.json { render :xml => @stat_affect }
    end
  end

  # GET /stat_affects/new
  # GET /stat_affects/new.xml
  def new
    @stat_affect = StatAffect.new
    @stats = Stat.find(:all)
    @eq_pieces = EquipmentPiece.find(:all)

    if params[:equipment_piece_id]
      @stat_affect.equipment_piece_id = params[:equipment_piece_id]
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stat_affect }
    end
  end

  # GET /stat_affects/1/edit
  def edit
    @stat_affect = StatAffect.find(params[:id])
    @stats = Stat.find(:all)
    @eq_pieces = EquipmentPiece.find(:all)
  end

  # POST /stat_affects
  # POST /stat_affects.xml
  def create
    @stat_affect = StatAffect.new(params[:stat_affect])

    respond_to do |format|
      if @stat_affect.save
        flash[:notice] = 'StatAffect was successfully created.'
        format.html { redirect_to(EquipmentPiece.find_by_id(@stat_affect.equipment_piece_id)) }
        format.xml  { render :xml => @stat_affect, :status => :created, :location => @stat_affect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stat_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stat_affects/1
  # PUT /stat_affects/1.xml
  def update
    @stat_affect = StatAffect.find(params[:id])

    respond_to do |format|
      if @stat_affect.update_attributes(params[:stat_affect])
        flash[:notice] = 'StatAffect was successfully updated.'
        format.html { redirect_to(@stat_affect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stat_affect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stat_affects/1
  # DELETE /stat_affects/1.xml
  def destroy
    @stat_affect = StatAffect.find(params[:id])
    @stat_affect.destroy

    respond_to do |format|
      flash[:notice] = 'StatAffect was successfully deleted.'
      format.html { redirect_to(EquipmentPiece.find_by_id(@stat_affect.equipment_piece_id)) }
      format.xml  { head :ok }
    end
  end
end
