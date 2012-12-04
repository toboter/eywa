class DefinitionsController < ApplicationController
  before_filter :login_required

  def index
    @project = Project.find(params[:project_id])
    @arr_definitions = @project.definitions
                      .arrange(:order => :name)
  end
  
  def show
    @project = Project.find(params[:project_id])
    @definition = @project.definitions.find(params[:id])
    @arr_definition = @definition
                      .subtree
                      .arrange(:order => :name) # die 2 Zugriffe hier sind nicht sonderlich günstig!
  end

  def new
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @definition = @project.definitions.build(:parent_id => params[:parent_id])

    @family_of_thing = @project.definitions.possible_parents('Thing', nil)
    @family_of_property = @project.definitions.possible_parents('topObjectProperty', nil)

    # any targets?
  end

  def create
  	@owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @definition = @project.definitions.build(params[:definition])

    if @definition.save
      redirect_to account_project_definition_url(@owner, @project, @definition), :notice => "Successfully created definition."
    else
      render :action => 'new'
    end
  end

  def edit
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @definition = @project.definitions.find(params[:id])

    @family_of_thing = @project.definitions.possible_parents('Thing', nil)
    @family_of_property = @project.definitions.possible_parents('topObjectProperty', nil)
    @upper_family = @project.definitions.possible_parents(@definition.root.name, @definition.subtree_ids)
  end

  def update
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @definition = @project.definitions.find(params[:id])

    if @definition.update_attributes(params[:definition])
      redirect_to account_project_definition_url(@owner, @project, @definition), :notice  => "Successfully updated definition."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @definition = @project.definitions.find(params[:id])

    @definition.destroy unless @definition.is_root?
    redirect_to account_project_definitions_url(@owner, @project), :notice => "Successfully destroyed definition."
  end
end