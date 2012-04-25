class ApplicationController < ActionController::Base
  before_filter :create_search
  protect_from_forgery

  def create_search
    @search = Search.new
  end
  
  helper_method :current_user_session, :current_user, :gmaps_api_key
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
     if current_user
       redirect_to logout_path
     else
       redirect_to login_path
     end
 
     return false
    end
  end

  def require_no_user
    if current_user
      redirect_to root_path
      return false
    end
  end

  def require_user_to_be_day_home_owner_or_admin
    unless (current_user && current_user.day_home_owner?) || (current_user && current_user.admin?)
      redirect_to root_path
    end
  end

  def require_user_to_be_site_admin
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end

  def gmaps_api_key
    if Rails.env.production?
      # return prod api key
      "AIzaSyB03go-dPecYfIzMYc1c9WFkK53QTiDwTA"
    else
      # return test/dev key
      "AIzaSyB03go-dPecYfIzMYc1c9WFkK53QTiDwTA"
    end
  end
end
