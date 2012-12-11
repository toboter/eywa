class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include Userstamp
  # include UrlHelper
  
  protect_from_forgery

private
  def authorized?(project)
    current_user == project.owner || project.memberships.where("account_id in (?) AND role like (?)", current_user.id, 'admin').exists? || aspect? && project.owner.fellowships.where("organisation_id in (?) AND role like (?)", current_aspect.id, 'admin').exists?
  end

  def authorized_to_layout(project, layout=nil)
    if authorized?(project)
      render :layout => layout unless layout == nil
    else
      unauthorized!
    end
  end

  def unauthorized!
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

end
