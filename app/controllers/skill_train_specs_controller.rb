class SkillTrainSpecsController < ApplicationController
  # GET /skill_train_specs
  # GET /skill_train_specs.xml
  def index
    @skill_train_specs = SkillTrainSpec.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skill_train_specs }
    end
  end

  # GET /skill_train_specs/1
  # GET /skill_train_specs/1.xml
  def show
    @skill_train_spec = SkillTrainSpec.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @skill_train_spec }
    end
  end

  # GET /skill_train_specs/new
  # GET /skill_train_specs/new.xml
  def new
    @skill_train_spec = SkillTrainSpec.new
    @skills = Skill.find(:all, :order => 'name ASC')
    @guilds = Guild.find(:all, :order => 'name ASC')

    if params[:guild_id]
      @skill_train_spec.guild_id = params[:guild_id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @skill_train_spec }
    end
  end

  # GET /skill_train_specs/1/edit
  def edit
    @skill_train_spec = SkillTrainSpec.find(params[:id])
    @skills = Skill.find(:all, :order => 'name ASC')
    @guilds = Guild.find(:all, :order => 'name ASC')
  end

  # POST /skill_train_specs
  # POST /skill_train_specs.xml
  def create
    @skill_train_spec = SkillTrainSpec.new(params[:skill_train_spec])

    respond_to do |format|
      if @skill_train_spec.save
        flash[:notice] = 'SkillTrainSpec was successfully created.'
        format.html { redirect_to(Guild.find_by_id(@skill_train_spec.guild_id)) }
        format.xml  { render :xml => @skill_train_spec, :status => :created, :location => @skill_train_spec }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @skill_train_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skill_train_specs/1
  # PUT /skill_train_specs/1.xml
  def update
    @skill_train_spec = SkillTrainSpec.find(params[:id])

    respond_to do |format|
      if @skill_train_spec.update_attributes(params[:skill_train_spec])
        flash[:notice] = 'SkillTrainSpec was successfully updated.'
        format.html { redirect_to(Guild.find_by_id(@skill_train_spec.guild_id)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @skill_train_spec.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_train_specs/1
  # DELETE /skill_train_specs/1.xml
  def destroy
    @skill_train_spec = SkillTrainSpec.find(params[:id])
    @skill_train_spec.destroy

    respond_to do |format|
      format.html { redirect_to(Guild.find_by_id(@skill_train_spec.guild_id)) }
      format.xml  { head :ok }
    end
  end
end
