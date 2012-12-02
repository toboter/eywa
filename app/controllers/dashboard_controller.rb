class DashboardController < ApplicationController
  def index
	@projects = Project.all
	@accounts = Account.all
	@users = Account.users
	@organisations = Account.organisations
  end
end
