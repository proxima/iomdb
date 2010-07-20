class ArmorClassLevelsController < ApplicationController
  # GET /armor_class_levels
  # GET /armor_class_levels.xml
  # GET /armor_class_levels.json
  def index
    @armor_class_levels = ArmorClassLevel.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @armor_class_levels }
      format.json { render :json => @armor_class_levels }
    end
  end

  # GET /armor_class_levels/1
  # GET /armor_class_levels/1.xml
  # GET /armor_class_levels/1.json
  def show
    @armor_class_level = ArmorClassLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @armor_class_level }
      format.json { render :json => @armor_class_level }
    end
  end

  # GET /armor_class_levels/new
  # GET /armor_class_levels/new.xml
  def new
    @armor_class_level = ArmorClassLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @armor_class_level }
    end
  end

  # GET /armor_class_levels/1/edit
  def edit
    @armor_class_level = ArmorClassLevel.find(params[:id])
  end

  # POST /armor_class_levels
  # POST /armor_class_levels.xml
  def create
    @armor_class_level = ArmorClassLevel.new(params[:armor_class_level])

    respond_to do |format|
      if @armor_class_level.save
        flash[:notice] = 'ArmorClassLevel was successfully created.'
        format.html { redirect_to(@armor_class_level) }
        format.xml  { render :xml => @armor_class_level, :status => :created, :location => @armor_class_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @armor_class_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /armor_class_levels/1
  # PUT /armor_class_levels/1.xml
  def update
    @armor_class_level = ArmorClassLevel.find(params[:id])

    respond_to do |format|
      if @armor_class_level.update_attributes(params[:armor_class_level])
        flash[:notice] = 'ArmorClassLevel was successfully updated.'
        format.html { redirect_to(@armor_class_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @armor_class_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /armor_class_levels/1
  # DELETE /armor_class_levels/1.xml
  def destroy
    @armor_class_level = ArmorClassLevel.find(params[:id])
    @armor_class_level.destroy

    respond_to do |format|
      format.html { redirect_to(armor_class_levels_url) }
      format.xml  { head :ok }
    end
  end
end
