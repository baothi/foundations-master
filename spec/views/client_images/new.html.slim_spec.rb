require 'rails_helper'

RSpec.describe "client_images/new", type: :view do
  before(:each) do
    assign(:client_image, ClientImage.new(
      :client => nil,
      :stage_references => "MyString"
    ))
  end

  it "renders new client_image form" do
    render

    assert_select "form[action=?][method=?]", client_images_path, "post" do

      assert_select "input#client_image_client_id[name=?]", "client_image[client_id]"

      assert_select "input#client_image_stage_references[name=?]", "client_image[stage_references]"
    end
  end
end
