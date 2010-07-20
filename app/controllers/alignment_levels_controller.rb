class AlignmentLevelsController < ApplicationController
  # GET /alignment_levels
  # GET /alignment_levels.xml
  # GET /alignment_levels.json
  def index
    @alignment_levels = AlignmentLevel.find(:all, :order => 'level ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alignment_levels }
      format.json { render :json => @alignment_levels }
    end
  end

  # GET /alignment_levels/1
  # GET /alignment_levels/1.xml
  # GET /alignment_levels/1.json
  def show
    @alignment_level = AlignmentLevel.find(params[:id])
    @versions = @alignment_level.versions.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alignment_level }
      format.json { render :json => @alignment_level }
    end
  end

  # GET /alignment_levels/new
  # GET /alignment_levels/new.xml
  def new
    @alignment_level = AlignmentLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alignment_level }
    end
  end

  # GET /alignment_levels/1/edit
  def edit
    @alignment_level = AlignmentLevel.find(params[:id])
  end

  # POST /alignment_levels
  # POST /alignment_levels.xml
  def create
    @alignment_level = AlignmentLevel.new(params[:alignment_level])

    respond_to do |format|
      if @alignment_level.save
        flash[:notice] = 'AlignmentLevel was successfully created.'
        format.html { redirect_to(@alignment_level) }
        format.xml  { render :xml => @alignment_level, :status => :created, :location => @alignment_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alignment_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alignment_levels/1
  # PUT /alignment_levels/1.xml
  def update
    @alignment_level = AlignmentLevel.find(params[:id])

    respond_to do |format|
      if @alignment_level.update_attributes(params[:alignment_level])
        flash[:notice] = 'AlignmentLevel was successfully updated.'
        format.html { redirect_to(@alignment_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alignment_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alignment_levels/1
  # DELETE /alignment_levels/1.xml
  def destroy
    @alignment_level = AlignmentLevel.find(params[:id])
    @alignment_level.destroy

    respond_to do |format|
      format.html { redirect_to(alignment_levels_url) }
      format.xml  { head :ok }
    end
  end

  def restore
    @alignment_level = AlignmentLevel.find(params[:alignment_level_id])
    @alignment_level.revert_to! params[:version_id]

    flash[:notice] = "AlignmentLevel was successfully restored to version #{params[:version_id]}"
    redirect_to(@alignment_level)
  end

end
