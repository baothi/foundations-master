require 'rails_helper'

RSpec.describe "image_categories/new", type: :view do
  before(:each) do
    assign(:image_category, ImageCategory.new(
      :image => nil
    ))
  end

  it "renders new image_category form" do
    render

    assert_select "form[action=?][method=?]", image_categories_path, "post" do

      assert_select "input#image_category_image_id[name=?]", "image_category[image_id]"
    end
  end
end
