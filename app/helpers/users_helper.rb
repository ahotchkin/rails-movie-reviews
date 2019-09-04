module UsersHelper

  def admin_header
    "ADMIN" if current_user.admin
  end
  
end
