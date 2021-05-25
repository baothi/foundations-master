require 'rails_helper'

RSpec.describe "image_categories/edit", type: :view do
  before(:each) do
    @image_category = assign(:image_category, ImageCategory.create!(
      :image => nil
    ))
  end

  it "renders the edit image_category form" do
    render

    assert_select "form[action=?][method=?]", image_category_path(@image_category), "post" do

      assert_select "input#image_category_image_id[name=?]", "image_category[image_id]"
    end
  end
end
