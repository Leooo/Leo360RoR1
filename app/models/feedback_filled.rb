class FeedbackFilled < ActiveRecord::Base
  belongs_to :user, :inverse_of => :feedback_filleds
  belongs_to :profile, :inverse_of => :feedback_filleds

  validates :user_id, presence: true
  validates :profile_id, presence: true

 private

    def self.fetch_by_names(profile_name,user_name)
      profile_id=Profile.find_by_name(profile_name).id
      user_id=User.find_by_name(user_name).id
      where("profile_id = ? and user_id = ?", profile_id, user_id).first
    end
end
