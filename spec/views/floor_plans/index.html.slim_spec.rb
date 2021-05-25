require 'rails_helper'

RSpec.describe 'floor_plans/index', type: :view do
  before(:each) do
    # assign(:floor_plans, [
    #   FloorPlan.create!(
    #     name: 'Name',
    #     description: 'MyText'
    #   ),
    #   FloorPlan.create!(
    #     name: 'Name',
    #     description: 'MyText'
    #   )
    # ])
  end

  it 'renders a list of floor_plans' do
    # render
    # assert_select 'tr>td', text: 'Name'.to_s, count: 2
    # assert_select 'tr>td', text: 'MyText'.to_s, count: 2
  end
end
