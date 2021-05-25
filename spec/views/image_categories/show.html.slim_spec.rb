require 'rails_helper'

RSpec.describe "image_categories/show", type: :view do
  before(:each) do
    @image_category = assign(:image_category, ImageCategory.create!(
      :image => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
