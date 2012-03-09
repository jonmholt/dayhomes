class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with :name => "dayhomes4admin", :password => "dayhomes4admin" if Rails.env.production?
  layout 'admin'
  helper_method :current_user_session, :current_user
  before_filter :require_user
  
  # ===============================
  # = User Authentication Related =
  # ===============================

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  # Make sure they are an admin!
  def require_user
    unless current_user
     if current_user && !current_user.admin?
       redirect_to admin_logout_path
     else
       redirect_to admin_login_path
     end
 
     return false
    end
  end

  def require_no_user
    if current_user
      redirect_to admin_root_path
      return false
    end
  end
  
end