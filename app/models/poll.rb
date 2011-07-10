class Poll < ActiveRecord::Base
  has_many :alternatives
  
  validates :question, :start_date, :finish_date, :presence => true
  
  def open?
    self.finish_date > Time.now and Time.now > self.start_date
  end
end
