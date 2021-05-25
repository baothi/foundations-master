require 'rails_helper'

RSpec.describe "client_images/index", type: :view do
  before(:each) do
    assign(:client_images, [
      ClientImage.create!(
        :client => nil,
        :stage_references => "Stage References"
      ),
      ClientImage.create!(
        :client => nil,
        :stage_references => "Stage References"
      )
    ])
  end

  it "renders a list of client_images" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Stage References".to_s, :count => 2
  end
end
