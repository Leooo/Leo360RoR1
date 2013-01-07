require 'spec_helper'

describe FeedbackFilled do

  before do
    @user = FactoryGirl.create(:user)
    @profile=FactoryGirl.create(:profile)
    @feedback_filled = FactoryGirl.create( :feedback_filled, profile: @profile, user: @user)
  end

  subject { @feedback_filled }

  it { should respond_to(:profile_id) }
  it { should respond_to(:profile) }
  its(:profile) { should ==@profile }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should ==@user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @feedback_filled.user_id = nil }
    it { should_not be_valid }
  end

  describe "when profile_id is not present" do
    before { @feedback_filled.profile_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        FeedbackFilled.new(user_id: @user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    it "should not allow access to profile_id" do
      expect do
        FeedbackFilled.new(profile_id: @user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end

