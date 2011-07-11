class Ballot < ActiveRecord::Base
  belongs_to :user
  belongs_to :alternative
  belongs_to :poll
  
  validates :user_id, :alternative_id, :presence => true
end
