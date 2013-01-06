class FeedbackFilled < ActiveRecord::Base
  attr_accessible :profile_id
  belongs_to :user

  validates :user_id, presence: true
  validates :profile_id, presence: true
end
