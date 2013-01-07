require 'spec_helper'

describe Profile do

  before {@profile=Profile.new(name: "example")}

  subject {@profile}
  
  it { should respond_to(:name) }
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name=" " }
    it {should_not be_valid}
  end

  describe "when name is too long" do
    before { @user.name="a"*52 }
    it {should_not be_valid}
  end

end
