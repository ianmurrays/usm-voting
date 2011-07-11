class Admin::PollsController < ApplicationController
  before_filter :authorize_admin
  
  def index
  end
  
  def new
    @poll = Poll.new
  end
  
  def create
    @poll = Poll.new params[:poll]
    
    respond_to do |f|
      if @poll.save
        f.html { redirect_to @poll }
      else
        f.html { render :action => :new }
      end
    end
  end
end