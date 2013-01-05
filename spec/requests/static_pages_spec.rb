require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 '360'" do
      #visit '/static_pages/home'
      visit root_path
      page.should have_selector('h1', :text => "360")
    end

    it "should have the title '360 | Home'" do
      visit root_path
      page.should have_selector('title', :text => "360 | Home")
    end

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      page.should have_content("Help")
    end

  end

  describe "About Us page" do

    it "should have the content 'About Us'" do
      visit about_path
      page.should have_content("About Us")
    end

  end

  describe "Contact page" do

    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', :text => "Contact")
    end

    it "should have the title '360 | Contact'" do
      visit contact_path
      page.should have_selector('title', :text => "360 | Contact")
    end

  end

end
