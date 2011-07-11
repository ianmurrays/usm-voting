class PollsController < ApplicationController
  def index
    @polls = Poll.order 'created_at desc'
    
    respond_to do |f|
      f.html
    end
  end
  
  def show
    # TODO: should not show alternatives after voting is closed
    @poll = Poll.find params[:id]
    
    respond_to do |f|
      f.html
    end
  end
  
  def cast_ballot
    @poll = Poll.find params[:id]
    
    # Has the user already voted?
    not_found and return if @poll.user_voted?(current_user) or @poll.closed?
    
    # Validate that the alternative is a valid one
    not_found and return unless alternative = Alternative.where(:poll_id => @poll.id, :id => params[:alternative]).first
    
    # Cast the ballot
    @poll.cast_ballot current_user, alternative
    
    redirect_to poll_path(@poll)
  end
end
