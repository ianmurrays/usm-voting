class Alternative < ActiveRecord::Base
  belongs_to :poll
  has_many :ballots
  
  validates :description, :poll_id, :presence => true
end
