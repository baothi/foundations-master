require 'rails_helper'

RSpec.describe 'elevations/index', type: :view do
  before(:each) do
    # assign(:elevations, [
    #   Elevation.create!(
    #     name: 'Name',
    #     description: 'MyText'
    #   ),
    #   Elevation.create!(
    #     name: 'Name',
    #     description: 'MyText'
    #   )
    # ])
  end

  it 'renders a list of elevations' do
    # render
    # assert_select 'tr>td', text: 'Name'.to_s, count: 2
    # assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
