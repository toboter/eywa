module ApplicationHelper
  def avatar_url(account, size)
    gravatar_id = Digest::MD5.hexdigest(account.email.downcase) if account.email
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end



end
