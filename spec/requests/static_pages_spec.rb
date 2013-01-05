require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path } 

    #it "should have the h1 '360'" do
      #visit '/static_pages/home'
      #visit root_path
    it { should have_selector('h1', text: "360") }
    #end

    it { should have_selector('title', :text => "360 | Home") }

  end

  describe "Help page" do
    before {visit help_path} 
      
    it {should have_content("Help")}

  end

  describe "About Us page" do
    before {visit about_path} 

    it {should have_content("About Us")}

  end

  describe "Contact page" do
    before {visit contact_path} 

    it {should have_selector('h1', :text => "Contact")}
    it {should have_selector('title', :text => "360 | Contact")}

  end

end
