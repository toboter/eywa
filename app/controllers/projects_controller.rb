class ProjectsController < ApplicationController
  before_filter :login_required
  
  def index
    @owner = Account.find(params[:account_id])
    @projects = @owner.own_projects.all
  end

  def show
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    render :layout => 'project'
  end

  def new
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.build
    @possible_members = Account.available_as_member(@project.accounts.map(&:id), @project.owner)
    render :layout => 'project'
  end

  def create
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.build(params[:project])
    if @project.save
      redirect_to account_project_url(@owner, @project), :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    @possible_members = Account.available_as_member(@project.accounts.map(&:id), @project.owner)
    render :layout => 'project'
  end

  def update
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to account_project_url(@owner, @project), :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @owner = Account.find(params[:account_id])
    @project = @owner.own_projects.find(params[:id])
    @project.destroy
    redirect_to account_url(@owner), :notice => "Successfully destroyed project."
  end
end
