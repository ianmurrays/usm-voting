class Alternative < ActiveRecord::Base
  belongs_to :poll
  
  validates :description, :poll_id, :presence => true
end
