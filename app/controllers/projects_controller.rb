class ProjectsController < ApplicationController
  before_filter :login_required, :except => :show

  def show
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    render :layout => 'project'
  end

  def new
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.build
    authorized_to_layout(@project, 'project') 
  end

  def create
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.build(params[:project])
    if authorized?(@project) && @project.save
      @project.memberships.create(:account_id => @project.owner.id, :role => 'admin')
      redirect_to account_project_url(@project.owner, @project), :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    authorized_to_layout(@project, 'project') 
  end

  def update
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    if authorized?(@project) && @project.update_attributes(params[:project])
      redirect_to account_project_url(@project.owner, @project), :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    if authorized?(@project)
      @project.destroy
      redirect_to account_url(@owner), :notice => "Successfully destroyed project."
    else
      unauthorized!
    end
  end

end
