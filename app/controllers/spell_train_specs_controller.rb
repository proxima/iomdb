class SpellTrainSpecsController < ApplicationController
  # GET /spell_train_specs
  # GET /spell_train_specs.xml
  def index
    @spell_train_specs = SpellTrainSpec.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spell_train_specs }
    end
  end

  # GET /spell_train_specs/1
  # GET /spell_train_specs/1.xml
  def show
    @spell_train_spec = SpellTrainSpec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spell_train_spec }
    end
  end

  # GET /spell_train_specs/new
  # GET /spell_train_specs/new.xml
  def new
    @spell_train_spec = SpellTrainSpec.new
    @spells = Spell.find(:all, :order => 'name ASC')
    @guilds = Guild.find(:all, :order => 'name ASC')

    if params[:guild_id]
      @spell_train_spec.guild_id = params[:guild_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spell_train_spec }
    end
  end

  # GET /spell_train_specs/1/edit
  def edit
    @spell_train_spec = SpellTrainSpec.find(params[:id])
    @spells = Spell.find(:all, :order => 'name ASC')
    @guilds = Guild.find(:all, :order => 'name ASC')
  end

  # POST /spell_train_specs
  # POST /spell_train_specs.xml
  def create
    @spell_train_spec = SpellTrainSpec.new(params[:spell_train_spec])

    respond_to do |format|
      if @spell_train_spec.save
        flash[:notice] = 'SpellTrainSpec was successfully created.'
        format.html { redirect_to(Guild.find_by_id(@spell_train_spec.guild_id)) }
        format.xml  { render :xml => @spell_train_spec, :status => :created, :location => @spell_train_spec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spell_train_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spell_train_specs/1
  # PUT /spell_train_specs/1.xml
  def update
    @spell_train_spec = SpellTrainSpec.find(params[:id])

    respond_to do |format|
      if @spell_train_spec.update_attributes(params[:spell_train_spec])
        flash[:notice] = 'SpellTrainSpec was successfully updated.'
        format.html { redirect_to(Guild.find_by_id(@spell_train_spec.guild_id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spell_train_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_train_specs/1
  # DELETE /spell_train_specs/1.xml
  def destroy
    @spell_train_spec = SpellTrainSpec.find(params[:id])
    @spell_train_spec.destroy

    respond_to do |format|
      format.html { redirect_to(Guild.find_by_id(@spell_train_spec.guild_id)) }
      format.xml  { head :ok }
    end
  end
end
