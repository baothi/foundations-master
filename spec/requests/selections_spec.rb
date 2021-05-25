require 'rails_helper'

RSpec.describe 'Selections', type: :request do
  describe 'GET /selections' do
    it 'works! (now write some real specs)' do
      get selections_path
      expect(response).to have_http_status(200)
    end
  end
end
