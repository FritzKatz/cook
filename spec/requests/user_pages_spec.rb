require 'spec_helper'

describe "AdministerUserPages" do
  subject { page }

  describe "Administer users page" do
    before { visit index_path }

    it { should have_content('Users') }
    it { should have_selector('title', text: full_title('Administer Users')) }  
  end
end
