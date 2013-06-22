require 'spec_helper'

describe "RecipePages" do
  subject { page }

  describe "New Recipe page" do
  	#let(:user) { FactoryGirl.create(:user) }
    before { visit topdf_path }

    it { should have_selector('h1', text: "Los geht's") }
    it { should have_selector('title', text: full_title('toPDF')) }    
  end

  describe "Preview Recipe page" do
  	#let(:user) { FactoryGirl.create(:user) }
    before { visit preview_path }

    it { should have_selector('h1', text: "Vorschau") }
    it { should have_selector('title', text: full_title('Preview')) }    
  end
end
