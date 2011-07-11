class Admin::UsersController < ApplicationController
  before_filter :authorize_admin
  
  def index
    @admins = User.where(:admin => true)
  end
  
  def revoke
    user = User.find params[:id]
    
    if user != current_user
      user.admin = false
      user.save
    end
    
    redirect_to admin_users_path
  end
  
  def grant
    user = User.find_by_email params[:email]
    
    if user
      user.admin = true
      user.save
    end
    
    redirect_to admin_users_path
  end
end