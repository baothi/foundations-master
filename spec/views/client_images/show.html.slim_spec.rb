require 'rails_helper'

RSpec.describe "client_images/show", type: :view do
  before(:each) do
    @client_image = assign(:client_image, ClientImage.create!(
      :client => nil,
      :stage_references => "Stage References"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Stage References/)
  end
end
