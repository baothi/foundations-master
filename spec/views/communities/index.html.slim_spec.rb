require 'rails_helper'

RSpec.describe 'communities/index', type: :view do
  before(:each) do
    # assign(:communities, [
    #   Community.create!(
    #     name: 'Name',
    #     address: 'Address',
    #     city: 'City',
    #     province: 'Province',
    #     postal_code: 'Postal Code',
    #     status: 1
    #   ),
    #   Community.create!(
    #     name: 'Name',
    #     address: 'Address',
    #     city: 'City',
    #     province: 'Province',
    #     postal_code: 'Postal Code',
    #     status: 1
    #   )
    # ])
  end

  it 'renders a list of communities' do
    # render
    # assert_select 'tr>td', text: 'Name'.to_s, count: 2
    # assert_select 'tr>td', text: 'Address'.to_s, count: 2
    # assert_select 'tr>td', text: 'City'.to_s, count: 2
    # assert_select 'tr>td', text: 'Province'.to_s, count: 2
    # assert_select 'tr>td', text: 'Postal Code'.to_s, count: 2
    # assert_select 'tr>td', text: 1.to_s, count: 2
  end
end
