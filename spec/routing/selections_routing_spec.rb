require 'rails_helper'

RSpec.describe SelectionsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/selections').to route_to('selections#index')
    end

    it 'routes to #new' do
      expect(get: '/selections/new').to route_to('selections#new')
    end

    it 'routes to #show' do
      expect(get: '/selections/1').to route_to('selections#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/selections/1/edit').to route_to('selections#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/selections').to route_to('selections#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/selections/1').to route_to('selections#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/selections/1').to route_to('selections#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/selections/1').to route_to('selections#destroy', id: '1')
    end

  end
end
