class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]
  
  def new
  end

  def create
    #render :text => request.env['omniauth.auth'].inspect
    # {"provider"=>"google", "uid"=>"http://alumnos.usm.cl/openid?id=##############", "user_info"=>{"email"=>"nombre.apellido@alumnos.usm.cl", "first_name"=>"nombre", "last_name"=>"apellido", "name"=>"nombre apellido"}}
    
    user = User.create_or_find_by_hash request.env['omniauth.auth']
    
    # Log him in
    self.current_user = user
    
    #render :text => "El user id es #{current_user.id}."
    redirect_to root_path
  end

end
