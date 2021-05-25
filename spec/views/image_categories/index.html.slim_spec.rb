require 'rails_helper'

RSpec.describe "image_categories/index", type: :view do
  before(:each) do
    assign(:image_categories, [
      ImageCategory.create!(
        :image => nil
      ),
      ImageCategory.create!(
        :image => nil
      )
    ])
  end

  it "renders a list of image_categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
