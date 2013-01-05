require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 '360'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => "360")
    end

    it "should have the title '360 | Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "360 | Home")
    end

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content("Help")
    end

  end

  describe "About Us page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content("About Us")
    end

  end

end
