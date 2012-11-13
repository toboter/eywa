class DefinitionsController < ApplicationController
  before_filter :login_required

  def show
    @definition = Definition.find(params[:id])
  end
end