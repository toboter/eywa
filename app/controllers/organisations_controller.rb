class OrganisationsController < ApplicationController
  before_filter :login_required

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(params[:organisation])
    if @organisation.save
      @organisation.fellowships.create(:user_id => current_user.id, :role => 'admin')
      redirect_to account_url(@organisation), :notice => "Successfully created organisation."
    else
      render :action => 'new'
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update_attributes(params[:organisation])
      redirect_to account_url(@organisation), :notice  => "Successfully updated organisation."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy
    redirect_to root_url, :notice => "Successfully destroyed organisation."
  end
end
