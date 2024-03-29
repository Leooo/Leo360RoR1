class Profile < ActiveRecord::Base

  attr_accessible :name
  has_many :feedback_filleds, :inverse_of => :profile
  has_many :users, :through => :feedback_filleds

  validates :name,presence: true, length: { maximum: 50 },
                  uniqueness: {case_sensitive: false}
 
  def fetch_feedback_filled_by_name(user_name)
    FeedbackFilled.fetch_by_names(self.name,user_name)
  end
      
private



end
