class UsersController < ApplicationController
  skip_before_filter :validate_profile, :only => [:sign_up, :save]
  
  def sign_up
    redirect_to root_path and return if current_user.registered
    
    @user = current_user
    
    respond_to do |f|
      f.html
    end
  end
  
  def save
    redirect_to root_path and return if current_user.registered
    
    @user = current_user
    
    # No overwritting this!
    params[:user][:registered] = false
    params[:user][:name] = current_user.name
    params[:user][:last_name] = current_user.last_name
    params[:user][:uid] = current_user.uid
    params[:user][:email] = current_user.email
    
    respond_to do |f|
      if @user.update_attributes(params[:user])
        @user.registered = true
        @user.save
        f.html { redirect_to root_path }
      else
        f.html { render :action => :sign_up }
      end
    end
  end
  
  def landing
    redirect_to sessions_new_path unless signed_in?
    render :text => "LANDING, if you're here we're good!"
  end
end
