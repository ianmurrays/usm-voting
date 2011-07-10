class Poll < ActiveRecord::Base
  has_many :alternatives
  
  validates :question, :start_date, :finish_date, :presence => true
end
