class AccountsController < ApplicationController
  before_filter :login_required, :except => :show

  def show
    @account = Account.find(params[:id])
    render :layout => 'account'
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to root_url, :notice => "Successfully deleted account."
  end
end
