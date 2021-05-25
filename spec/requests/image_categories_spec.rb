require 'rails_helper'

RSpec.describe "ImageCategories", type: :request do
  describe "GET /image_categories" do
    it "works! (now write some real specs)" do
      get image_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
