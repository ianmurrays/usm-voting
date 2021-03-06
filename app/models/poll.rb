class Poll < ActiveRecord::Base
  has_many :alternatives
  has_many :ballots
  
  accepts_nested_attributes_for :alternatives
  
  validates :question, :start_date, :finish_date, :presence => true
  
  def open?
    self.finish_date > Time.now and Time.now > self.start_date
  end
  
  def closed?
    !open?
  end
  
  # If the poll already occured
  def finished?
    self.finish_date < Time.now
  end
  
  def not_started?
    self.start_date > Time.now
  end
  
  def user_voted?(user)
    Ballot.where(:poll_id => self.id, :user_id => user.id).count == 1
  end
  
  def cast_ballot(user, alternative)
    return if user_voted?(user)
    alternative.ballots.build :user => user, :poll => self
    alternative.save
  end
  
  def total_ballots
    @total_ballots ||= Ballot.where(:poll_id => self.id).count
    @total_ballots
  end
end
