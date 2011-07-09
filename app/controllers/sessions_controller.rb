class SessionsController < ApplicationController
  def new
  end

  def create
    render :text => request.env['omniauth.auth'].inspect
  end

end
