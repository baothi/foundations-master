Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    :invitations => 'users/invitations'
  }
  resources :users do
    member do
      post :update_role
    end
  end

  apipie
  # resources :floor_plans
  # resources :elevations
  resources :categories
  resources :image_categories
  resources :stages
  resources :models
  resources :settings do
    collection do
      post :update_all
    end
  end
  resources :communities
  resources :amenities
  resources :clients do
    put 'update_remote'

    # Selections and Upgrades only apply to clients
    resources :selections
    resources :upgrades
    resources :client_images
    resources :client_documents, path: 'documents'
    resources :floor_plans, controller: 'floor_plans'
    resources :elevations, controller: 'elevations'
  end

  get 'update_stage_select' => 'clients#update_stage_select', as: :update_stage_select

  root to: "dashboard#index"


  namespace :dashboard do
  end

end
