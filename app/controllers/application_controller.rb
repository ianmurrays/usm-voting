class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :validate_profile, :authorize
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end
  
  def current_user=(user)
    @current_user = user
    
    session[:user_id] = user.id
  end
  
  helper_method :current_user, :signed_in?
  
  def authorize
    redirect_to sessions_new_path unless signed_in?
  end
  
  def authorize_admin
    redirect_to sessions_new_path unless signed_in? and current_user.admin
  end
  
  def validate_profile
    if signed_in?
      redirect_to sign_up_path unless current_user.registered
    end
  end
  
  def not_found
    render(:file => "#{Rails.root.to_s}/public/404.html", :layout => false, :status => 404)
  end
end
