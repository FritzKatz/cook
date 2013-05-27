require 'spec_helper'

describe "Pages" do

  describe "Home page" do

    it "should have the content 'Willkommen'" do
      visit '/pages/home'
      expect(page).to have_content('Willkommen')
    end
  end
end
