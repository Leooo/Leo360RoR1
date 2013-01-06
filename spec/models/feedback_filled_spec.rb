require 'spec_helper'

describe FeedbackFilled do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @feedback_filled = user.feedback_filleds.build( profile_id: 1)
  end

  subject { @feedback_filled }

  it { should respond_to(:profile_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should ==user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @feedback_filled.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        FeedbackFilled.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

end

