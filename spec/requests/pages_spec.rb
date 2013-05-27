require 'spec_helper'

describe "Pages" do

  describe "Home page" do

    it "should have the content 'Willkommen'" do
      visit '/pages/home'
      expect(page).to have_content('Willkommen')
    end

    it "should have the base title" do
      visit '/pages/home'
      page.should have_selector('title', :text => "ReGen")
    end

    it "should not have a custom page title" do
      visit '/pages/home'
      page.should_not have_selector('title', :text => '| Home')      
    end
    
  end
end
