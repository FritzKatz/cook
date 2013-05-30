require 'spec_helper'

describe "AdministerUserPages" do
  subject { page }

  describe "Administer users page" do

  	#let(:user) { FactoryGirl.create(:user) }

    before { visit index_path }

    it { should have_content('Users') }
    it { should have_selector('title', text: full_title('Administer Users')) }
    it { should have_table('Users') }
    it { should have_selector('th', text: 'NAME') }
    it { should have_selector('th', text: 'E-MAIL') }
    it { should have_selector('th', text: 'CHECK') }

  end
end
