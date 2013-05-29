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
    #it { should have_link("Re|X|Gen", href: root_path) }      
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About')
    click_link "Re|X|Gen"    
    page.should have_selector 'h1', text: 'Willkommen'
  end
end

