require 'rails_helper'

RSpec.describe 'models/index', type: :view do
  before(:each) do
    # assign(:models, [
    #   Model.create!(
    #     name: 'Name',
    #     description: 'MyText',
    #     square_footage: 'Square Footage'
    #   ),
    #   Model.create!(
    #     name: 'Name',
    #     description: 'MyText',
    #     square_footage: 'Square Footage'
    #   )
    # ])
  end

  it 'renders a list of models' do
    # render
    # assert_select 'tr>td', text: 'Name'.to_s, count: 2
    # assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    # assert_select 'tr>td', text: 'Square Footage'.to_s, count: 2
  end
end
