require 'spec_helper'

describe "Pages" do

	subject { page }

  describe "Home page" do
  	before { visit root_path }

  	it { should have_content('Willkommen') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }  
  end

  describe "About page" do
  	before { visit about_path }

  	# it { should have_content('Willkommen') }
   #  it { should have_title(full_title('About')) }


    it "should have the content 'Willkommen'" do
      #visit about_path
      expect(page).to have_content('Willkommen')
    end

    it "should have the base title" do
      #visit about_path
      page.should have_selector('title', :text => "ReGen")
    end        
  end
end
