require 'spec_helper'

describe Profile do

  before do
    @profile=FactoryGirl.create(:profile)
    
  end

  subject {@profile}
  
  it { should respond_to(:name) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @profile.name=" " }
    it {should_not be_valid}
  end

  describe "when name is too long" do
    before { @profile.name="a"*52 }
    it {should_not be_valid}
  end

end
