class OrganisationsController < ApplicationController
  before_filter :login_required

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(params[:organisation])
    if @organisation.save
      @organisation.fellowships.create(:user_id => current_user.id, :role => 'admin')
      session[:organisation_id] = @organisation.id
      redirect_to account_url(@organisation), :notice => "Successfully created organisation."
    else
      render :action => 'new'
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
    if account_authorized?(@organisation)
      render 'edit'
    else
      unauthorized!
    end
  end

  def update
    @organisation = Organisation.find(params[:id])
    if account_authorized?(@organisation) && @organisation.update_attributes(params[:organisation])
      redirect_to account_url(@organisation), :notice  => "Successfully updated organisation."
    else
      render :action => 'edit'
    end
  end

private
  def account_authorized?(organisation)
    aspect? && organisation.fellowships.where("organisation_id in (?) AND role like (?)", current_aspect.id, 'admin').exists?
  end

end
