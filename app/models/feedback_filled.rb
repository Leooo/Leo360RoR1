class FeedbackFilled < ActiveRecord::Base
  belongs_to :user, :inverse_of => :feedback_filleds
  belongs_to :profile, :inverse_of => :feedback_filleds

  validates :user_id, presence: true
  validates :profile_id, presence: true
end
