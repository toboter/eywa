class AccountsController < ApplicationController
  before_filter :login_required, :except => :show

  def show
    @account = Account.find(params[:id])
    render :layout => 'account'
  end

  def destroy
    @account = Account.find(params[:id])
    if @account.type == 'User' && @account == current_user or @account.type == 'Organisation' && aspect? && current_aspect == @account
      if @account.own_projects.empty? #transfer rights to someone
        session[:organisation_id] = nil if @account.type == 'Organisation'
        session[:user_id] = nil if @account.type == 'User'
        @account.destroy
        redirect_to root_url, :notice => "Successfully deleted account."
      else 
        flash[:error] = "You still have projects! Transfer their ownership or delete them first!"
        redirect_to :back
      end
    else
      unauthorized!
    end
  end
end
