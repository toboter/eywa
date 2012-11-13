class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    render :layout => 'account'
  end

  def new
    @user = User.new
    render :layout => 'sign_in'
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
    render :layout => 'account'
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end
