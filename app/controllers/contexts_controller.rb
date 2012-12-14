class ContextsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @project = Project.find(params[:project_id])
    @contexts = @project.contexts.all
  end

  def show
    @project = Project.find(params[:project_id])
    @context = @project.contexts.find(params[:id])
  end

  def new
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @context = @project.contexts.build

    authorized_to_layout(@project)
  end

  def create
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @context = @project.contexts.build(params[:context])
    if authorized?(@context.project) && @context.save
      redirect_to account_project_context_url(@context.project.owner, @context.project, @context), :notice => "Successfully created context."
    else 
      render :action => 'new'
    end
  end

  def edit
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @context = @project.contexts.find(params[:id])

    authorized_to_layout(@project)
  end

  def update
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @context = @project.contexts.find(params[:id])

    if authorized?(@context.project) && @context.update_attributes(params[:context])
      redirect_to account_project_context_url(@owner, @project, @context), :notice  => "Successfully updated context."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:project_id])
    @context = @project.contexts.find(params[:id])
    if authorized?(@context.project)
      @context.destroy 
      redirect_to account_project_contexts_url(@owner, @project), :notice => "Successfully destroyed context."
    else
      unauthorized!
    end
  end
end
