class PollsController < ApplicationController
  def index
    @polls = Poll.order 'created_at desc'
    
    respond_to do |f|
      f.html
    end
  end
  
  def show
    @poll = Poll.find params[:id]
    
    respond_to do |f|
      f.html
    end
  end
end
