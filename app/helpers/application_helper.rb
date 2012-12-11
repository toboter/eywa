module ApplicationHelper
  def avatar_url(account, size)
    gravatar_id = Digest::MD5.hexdigest(account.email.downcase) if account.email
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def admin_for_project(project)
  	current_user == project.owner || project.memberships.where("account_id in (?) AND role like (?)", current_user.id, 'admin').exists? || aspect? && project.owner.fellowships.where("organisation_id in (?) AND role like (?)", current_aspect.id, 'admin').exists?
  end

  def admin_for_organisation(organisation)
  	logged_in? && organisation.type == 'Organisation' && aspect? && current_aspect == organisation
  end


end
