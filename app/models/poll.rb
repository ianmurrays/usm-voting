class Poll < ActiveRecord::Base
  has_many :alternatives
  has_many :ballots
  
  validates :question, :start_date, :finish_date, :presence => true
  
  def open?
    self.finish_date > Time.now and Time.now > self.start_date
  end
  
  def closed?
    !open?
  end
  
  def user_voted?(user)
    Ballot.where(:poll_id => self.id, :user_id => user.id).count == 1
  end
  
  def cast_ballot(user, alternative)
    return if user_voted?(user)
    alternative.ballots.build :user => user, :poll => self
    alternative.save
  end
end
