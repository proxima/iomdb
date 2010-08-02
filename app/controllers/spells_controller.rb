class SpellsController < ApplicationController
  # GET /spells
  # GET /spells.xml
  # GET /spells.json
  def index
    @spells = Spell.paginate :page => params[:page], :order => 'name ASC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spells }
      format.json { render :json => @spells }
    end
  end

  # GET /spells/1
  # GET /spells/1.xml
  def show
    @spell = Spell.find(params[:id])
    @train_specs = SpellTrainSpec.find_all_by_spell_id(params[:id], :order => 'guild_id ASC, max ASC')
    @eq_mods = SpellAffect.find_all_by_spell_id(params[:id], :order => 'value DESC')

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @spell }
    end
  end

  # GET /spells/new
  # GET /spells/new.xml
  def new
    @spell = Spell.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spell }
    end
  end

  # GET /spells/1/edit
  def edit
    @spell = Spell.find(params[:id])
  end

  # POST /spells
  # POST /spells.xml
  def create
    @spell = Spell.new(params[:spell])

    respond_to do |format|
      if @spell.save
        flash[:notice] = 'Spell was successfully created.'
        format.html { redirect_to(@spell) }
        format.xml  { render :xml => @spell, :status => :created, :location => @spell }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spells/1
  # PUT /spells/1.xml
  def update
    @spell = Spell.find(params[:id])

    respond_to do |format|
      if @spell.update_attributes(params[:spell])
        flash[:notice] = 'Spell was successfully updated.'
        format.html { redirect_to(@spell) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spells/1
  # DELETE /spells/1.xml
  def destroy
    @spell = Spell.find(params[:id])
    @spell.destroy

    respond_to do |format|
      format.html { redirect_to(spells_url) }
      format.xml  { head :ok }
    end
  end
end
