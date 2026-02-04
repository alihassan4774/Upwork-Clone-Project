module ApplicationHelper
 def logo_redirect_path
  return root_path unless user_signed_in?

  if current_user.client?
    user_client_path
  elsif current_user.freelancer?
    user_freelancer_path
  else
    role_path
  end
end
end
