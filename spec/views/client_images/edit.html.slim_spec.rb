require 'rails_helper'

RSpec.describe "client_images/edit", type: :view do
  before(:each) do
    @client_image = assign(:client_image, ClientImage.create!(
      :client => nil,
      :stage_references => "MyString"
    ))
  end

  it "renders the edit client_image form" do
    render

    assert_select "form[action=?][method=?]", client_image_path(@client_image), "post" do

      assert_select "input#client_image_client_id[name=?]", "client_image[client_id]"

      assert_select "input#client_image_stage_references[name=?]", "client_image[stage_references]"
    end
  end
end
