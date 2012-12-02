class SessionsController < ApplicationController
  def new
  end

  def create
    unless logged_in?
      user = User.authenticate(params[:login], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to_target_or_default root_url, :notice => "Logged in successfully."
      else
        flash.now[:alert] = "Invalid login or password."
        render :action => 'new'
      end
    else
      organisation = Organisation.find(params[:organisation_id])
      if organisation
        session[:organisation_id] = organisation.id
        redirect_to account_url(organisation), :notice => "Changed aspect."
      else
        redirect_to_target_or_default root_url, :notice => "Error."
      end
    end
  end

  def destroy
    session[:organisation_id] = nil
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

  def leave
    session[:organisation_id] = nil
    redirect_to root_url, :notice => "Switched back."
  end
end
