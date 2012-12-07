class SessionsController < ApplicationController
  before_filter :login_required, :only => [:create_aspect, :destroy_aspect]
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def create_aspect
    if logged_in?
      organisation = Organisation.find(params[:organisation_id])
      if organisation
        session[:organisation_id] = organisation.id
        redirect_to account_url(organisation), :notice => "Changed aspect to #{current_aspect.username}."
      else
        flash.now[:alert] = "Something went wrong."
        redirect_to_target_or_default root_url, :notice => "Error."
      end
    end
  end

  def destroy
    session[:organisation_id] = nil
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

  def destroy_aspect
    session[:organisation_id] = nil
    redirect_to root_url, :notice => "Switched to your personal account."
  end
end
