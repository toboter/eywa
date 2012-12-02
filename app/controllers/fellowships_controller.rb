class FellowshipsController < ApplicationController
  def create
    @fellowship = Fellowship.new(params[:fellowship])
    if @fellowship.save
      redirect_to root_url, :notice => "Successfully added fellow."
    else
      render :action => 'new'
    end
  end

  def destroy
    @fellowship = Fellowship.find(params[:id])
    @fellowship.destroy
    redirect_to root_url, :notice => "Removed fellow."
  end
end
