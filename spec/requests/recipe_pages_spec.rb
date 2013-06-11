require 'spec_helper'

describe "RecipePages" do
  describe "GET /recipe_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get recipe_pages_index_path
      response.status.should be(200)
    end
  end
end
