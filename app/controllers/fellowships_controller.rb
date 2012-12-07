class FellowshipsController < ApplicationController

  def create
    @organisation = Organisation.find(params[:organisation_id])
    if aspect? && current_aspect == @organisation
      @user = User.find_by_username(params[:username])
      if @user
        @possible_fellows = User.possible_fellows(@organisation.fellowships.map(&:user_id))
        if @possible_fellows.include?(@user)
          @fellowship = @organisation.fellowships.build(:user_id => @user.id, :role => params[:role])
          if @fellowship.save
            redirect_to account_path(@organisation), :notice => "Successfully added fellow."
          else
            flash[:error] = "Unable to add fellow."
            redirect_to account_path(@organisation)
          end
        else
          flash[:error] = "User already on the list"
          redirect_to account_path(@organisation)
        end
      else
        flash[:error] = "No such user."
        redirect_to account_path(@organisation)
      end
    else
      flash[:error] = "You do not have the correct aspect."
      redirect_to account_path(@organisation)
    end 
  end

  def destroy
    @organisation = Organisation.find(params[:account_id])
    if aspect? && current_aspect == @organisation
      @fellowship = @organisation.fellowships.find(params[:id])
      @fellowship.destroy
      redirect_to account_path(@organisation), :notice => "Removed fellow."
    else
      flash[:error] = "You do not have the correct aspect."
      redirect_to account_path(@organisation)
    end 
  end


end
