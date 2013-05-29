require 'spec_helper'

describe "Pages" do

	subject { page }

  describe "Home page" do
  	before { visit root_path }

    it { should have_selector('h1',    text: 'Willkommen') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }    
  end

  describe "About page" do
  	before { visit about_path }

    it { should have_selector('h1',    text: 'Willkommen') }
    it { should have_selector('title', text: full_title('About')) }       
  end
end
